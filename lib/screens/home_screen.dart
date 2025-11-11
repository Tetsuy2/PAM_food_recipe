// lib/screens/home_screen.dart  (only the New Recipes builder changed)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ui_components/features/home/bloc/home_bloc.dart';
import 'package:ui_components/features/home/bloc/home_state.dart';
import 'package:ui_components/features/home/bloc/home_event.dart';

import 'package:ui_components/widgets/top_bar.dart';
import 'package:ui_components/widgets/search_bar.dart';
import 'package:ui_components/widgets/segmented_tabs.dart';
import 'package:ui_components/widgets/dish_category_card.dart';
import 'package:ui_components/widgets/new_recipe_small_card.dart';
import 'package:ui_components/screens/recipe_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const double side = 32.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeError) {
            return Center(
              child: Text('Error: ${state.message}',
                  style: const TextStyle(color: Colors.red)),
            );
          }
          final s = state as HomeLoaded;
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 2)),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopBar(
                      name: s.data.user.name,
                      greeting: s.data.user.greeting,
                      profileImage: s.data.user.profileImage,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: side),
                      child: SearchBarX(
                        hintText: s.data.searchPlaceholder,
                        onChanged: (q) =>
                            context.read<HomeBloc>().add(SearchChanged(q)),
                      ),
                    ),
                    const SizedBox(height: 26),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: side),
                      child: SegmentedTabs(
                        tabs: s.data.categories.map((c) => c.name).toList(),
                        active: s.selectedCuisine,
                        onChanged: (t) =>
                            context.read<HomeBloc>().add(CuisineChanged(t)),
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      height: 264,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        padding: const EdgeInsets.only(left: side),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: s.visibleRecipes.length,
                        itemBuilder: (ctx, i) {
                          final r = s.visibleRecipes[i];
                          final int rid = int.tryParse(r.id.toString()) ?? 0;
                          return Padding(
                            padding: EdgeInsets.only(
                              right:
                                  i == s.visibleRecipes.length - 1 ? side : 14,
                            ),
                            child: DishCategoryCard(
                              title: r.name.replaceAll(' ', '\n'),
                              time: r.time,
                              rating: r.rating,
                              image: r.image,
                              onTap: () {
                                Navigator.push(
                                  ctx,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        RecipeDetailsScreen(recipeId: rid),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: side),
                      child: Text(
                        'New Recipes',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      height: 126,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        padding: const EdgeInsets.only(left: side),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: s.visibleNewRecipes.length,
                        itemBuilder: (ctx, i) {
                          final r = s.visibleNewRecipes[i];
                          final int rid = int.tryParse(r.id.toString()) ?? 0;

                          // deterministic placeholder selection: user1/user2
                          final placeholder = (rid % 2 == 0)
                              ? 'assets/user1.png'
                              : 'assets/user2.png';

                          return Padding(
                            padding: EdgeInsets.only(
                              right: i == s.visibleNewRecipes.length - 1
                                  ? side
                                  : 22,
                            ),
                            child: NewRecipeSmallCard(
                              title: r.name,
                              dishImage: r.image,
                              authorImage: (r.authorImage.isEmpty)
                                  ? placeholder
                                  : r.authorImage,
                              authorName: r.author,
                              time: r.time,
                              onTap: () {
                                Navigator.push(
                                  ctx,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        RecipeDetailsScreen(recipeId: rid),
                                  ),
                                );
                              },
                            ),
                          );
                        },
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
