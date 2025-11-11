import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ui_components/features/details/bloc/details_bloc.dart';
import 'package:ui_components/features/details/bloc/details_event.dart';
import 'package:ui_components/features/details/bloc/details_state.dart';
import 'package:ui_components/widgets/recipe_details_page.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({super.key, required this.recipeId});
  final int recipeId;

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DetailsBloc>().add(DetailsRequested(widget.recipeId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DetailsError) {
            return Center(
              child: Text(state.message,
                  style: const TextStyle(color: Colors.red)),
            );
          }

          final s = state as DetailsLoaded;
          final d = s.data;

          // 2-line title exactly as requested
          const String title = 'Spicy chicken burger\nwith French fries';

          return RecipeDetailsPage(
            title: title,
            bannerImage: d.recipe.image,
            gradientOverlay: 'assets/gradient_food-banner.png',
            rating: d.recipe.rating,
            timeLabel: d.recipe.cookTimeLabel, // shown on banner bottom-right
            authorName: d.chef.name,
            authorAvatar: (d.chef.profileImage.isEmpty)
                ? 'assets/user2.png'
                : d.chef.profileImage,
            locationLabel: d.chef.location,
            reviewsLabel: '(13k Reviewers)', // parentheses
            ingredients: [
              for (final it in d.ingredients)
                IngredientTileData(
                  image: (it.icon.isEmpty || it.icon == '...')
                      ? 'assets/bread.png'
                      : it.icon,
                  name: it.name,
                  amount: it.quantity,
                ),
            ],
            steps: d.steps,
          );
        },
      ),
    );
  }
}
