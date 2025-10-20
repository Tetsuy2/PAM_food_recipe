import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/segmented_tabs.dart';
import '../widgets/dish_category_card.dart';
import '../widgets/new_recipe_small_card.dart';
import 'recipe_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cuisine = 'All';

  // Precache hero images so they render immediately and avoid “empty data”.
  bool _didPrecache = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_didPrecache) {
      for (final path in const [
        'assets/new_food1.png',
        'assets/new_food2.png',
        'assets/new_food3.png',
      ]) {
        precacheImage(AssetImage(path), context);
      }
      _didPrecache = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    const side = 32.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 2)),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopBar(),
                const SizedBox(height: 10),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: side),
                  child: SearchBarX(),
                ),
                const SizedBox(height: 26),

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

                // HERO ROW
                Container(
                  color: Colors.white,
                  child: SizedBox(
                    height: 264,
                    child: ListView(
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.only(left: side),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        DishCategoryCard(
                          title: 'Classic Greek\nSalad',
                          time: '15 Mins',
                          rating: 4.5,
                          image: 'assets/new_food3.png',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RecipeDetailsScreen(),
                              settings: const RouteSettings(
                                  arguments: {'title': 'Classic Greek Salad'}),
                            ),
                          ),
                        ),
                        DishCategoryCard(
                          title: 'Crunchy Nut\nColeslaw',
                          time: '10 Mins',
                          rating: 3.5,
                          image: 'assets/new_food3.png',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RecipeDetailsScreen(),
                              settings: const RouteSettings(
                                  arguments: {'title': 'Crunchy Nut Coleslaw'}),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: side),
                          child: DishCategoryCard(
                            title: 'Fresh Caprese\nSkewers',
                            time: '12 Mins',
                            rating: 4.2,
                            image: 'assets/food_banner.png',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RecipeDetailsScreen(),
                                settings: const RouteSettings(arguments: {
                                  'title': 'Fresh Caprese Skewers'
                                }),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: side),
                  child: Text('New Recipes',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                ),
                const SizedBox(height: 18),

                // New Recipes
                Container(
                  color: Colors.white,
                  height: 126,
                  child: ListView(
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.only(left: side),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      NewRecipeSmallCard(
                        title: 'Steak with tomato…',
                        dishImage: 'assets/new_food3.png',
                        authorImage: 'assets/user1.png',
                        authorName: 'James Milner',
                        time: '20 mins',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RecipeDetailsScreen(),
                            settings: const RouteSettings(
                                arguments: {'title': 'Steak with tomatoes'}),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: side),
                        child: NewRecipeSmallCard(
                          title: 'Pilaf sweet bread…',
                          dishImage: 'assets/food_banner.png',
                          authorImage: 'assets/user2.png',
                          authorName: 'Laura',
                          time: '10 mins',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RecipeDetailsScreen(),
                              settings: const RouteSettings(
                                  arguments: {'title': 'Pilaf sweet bread'}),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
