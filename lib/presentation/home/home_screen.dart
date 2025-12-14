import 'package:flutter/material.dart';

import '../../widgets/top_bar.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/segmented_tabs.dart';
import '../../widgets/dish_category_card.dart';
import '../../widgets/new_recipe_small_card.dart';

import '../../data/datasource/feed_api_service.dart';
import '../../data/repository/feed_repository_impl.dart';
import '../../domain/usecases/get_feed.dart';
import '../../domain/entities/feed_entity.dart';
import 'home_controller.dart';

import '../details/recipe_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;
  String cuisine = 'All';

  bool _didPrecache = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_didPrecache) {
      for (final path in const [
        'assets/new_food1.png',
        'assets/new_food2.png',
        'assets/new_food3.png',
        'assets/food_banner.png',
      ]) {
        precacheImage(AssetImage(path), context);
      }
      _didPrecache = true;
    }
  }

  @override
  void initState() {
    super.initState();

    controller = HomeController(
      GetFeed(
        FeedRepositoryImpl(
          FeedApiService(),
        ),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.load();
    });
  }

  @override
  Widget build(BuildContext context) {
    const side = 32.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          if (controller.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.data == null) {
            return const Center(
              child: Text("No data loaded"),
            );
          }

          final FeedEntity feed = controller.data!;

          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 2)),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopBar(),
                    const SizedBox(height: 10),

                    // SEARCH
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: side),
                      child: SearchBarX(),
                    ),
                    const SizedBox(height: 26),

                    // TABS
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: side),
                      child: SegmentedTabs(
                        tabs: const [
                          'All',
                          'Indian',
                          'Italian',
                          'Asian',
                          'Chinese'
                        ],
                        active: cuisine,
                        onChanged: (t) => setState(() => cuisine = t),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // HERO ROW date din API
                    Container(
                      color: Colors.white,
                      child: SizedBox(
                        height: 264,
                        child: ListView(
                          clipBehavior: Clip.none,
                          padding: const EdgeInsets.only(left: side),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: feed.recipes.map((r) {
                            return DishCategoryCard(
                              title: r.name,
                              time: r.time,
                              rating: r.rating,
                              image: r.image,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RecipeDetailsScreen(),
                                    settings: RouteSettings(arguments: r.id),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: side),
                      child: Text(
                        'New Recipes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // imagini din API
                    Container(
                      color: Colors.white,
                      height: 126,
                      child: ListView(
                        clipBehavior: Clip.none,
                        padding: const EdgeInsets.only(left: side),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: feed.newRecipes.map((r) {
                          return NewRecipeSmallCard(
                            title: r.name,
                            dishImage: r.image,
                            authorName: r.author ?? '',
                            authorImage: r.authorImage ?? '',
                            time: r.time,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const RecipeDetailsScreen(),
                                  settings: RouteSettings(arguments: r.id),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
