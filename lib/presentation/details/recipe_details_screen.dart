import 'package:flutter/material.dart';

import '../../domain/usecases/get_details.dart';
import '../../domain/entities/details_entity.dart';
import '../../data/repository/details_repository_impl.dart';
import '../../data/datasource/details_api_service.dart';

import '../../widgets/recipe_details_page.dart';
import 'details_controller.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({super.key});
  static const route = '/recipe';

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  late DetailsController controller;

  @override
  void initState() {
    super.initState();

    controller = DetailsController(
      GetDetails(
        DetailsRepositoryImpl(
          DetailsApiService(),
        ),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final id = ModalRoute.of(context)!.settings.arguments as int;
      controller.load(id);
    });
  }

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
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          if (controller.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.data == null) {
            return const Center(child: Text('No data loaded'));
          }

          final DetailsEntity d = controller.data!;

          return RecipeDetailsPage(
            title: d.recipe.title,
            bannerImage: d.recipe.image,
            gradientOverlay:
                'assets/gradient_food-banner.png', // aceeași ca în UI vechi
            rating: d.recipe.rating,
            timeLabel: d.recipe.cookTime,
            authorName: d.chef.name,
            authorAvatar: d.chef.profileImage,
            locationLabel: d.chef.location,
            reviewsLabel: d.recipe.reviews,
            ingredients: d.ingredients
                .map(
                  (i) => IngredientItem(
                    image: i.icon,
                    name: i.name,
                    amount: i.quantity,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
