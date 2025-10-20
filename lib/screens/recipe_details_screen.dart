import 'package:flutter/material.dart';
import '../widgets/recipe_details_page.dart';

class RecipeDetailsScreen extends StatelessWidget {
  static const route = '/recipe';
  const RecipeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: const RecipeDetailsPage(
        title: 'Spicy chicken burger\nwith French fries',
        bannerImage: 'assets/food_banner.png',
        gradientOverlay: 'assets/gradient_food-banner.png',
        rating: 4.0,
        timeLabel: '20 min',
        authorName: 'Laura wilson',
        authorAvatar: 'assets/user2.png',
        locationLabel: 'Lagos, Nigeria',
        reviewsLabel: '(13k Reviewers)',
        ingredients: [
          IngredientItem(
              image: 'assets/tomatos.png', name: 'Tomatos', amount: '500g'),
          IngredientItem(
              image: 'assets/cabbage.png', name: 'Cabbage', amount: '300g'),
          IngredientItem(
              image: 'assets/taco.png', name: 'Taco', amount: '300g'),
          IngredientItem(
              image: 'assets/bread.png', name: 'Slice Bread', amount: '300g'),
        ],
      ),
    );
  }
}
