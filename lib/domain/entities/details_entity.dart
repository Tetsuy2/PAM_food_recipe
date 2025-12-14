class DetailsEntity {
  final RecipeDetailsEntity recipe;
  final ChefEntity chef;
  final List<TabEntity> tabs;
  final ServingEntity serving;
  final List<IngredientEntity> ingredients;

  DetailsEntity({
    required this.recipe,
    required this.chef,
    required this.tabs,
    required this.serving,
    required this.ingredients,
  });
}

class RecipeDetailsEntity {
  final int id;
  final String title;
  final String image;
  final double rating;
  final String reviews;
  final String cookTime;
  final bool isBookmarked;

  RecipeDetailsEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.cookTime,
    required this.isBookmarked,
  });
}

class ChefEntity {
  final String name;
  final String profileImage;
  final String location;
  final bool isFollowing;

  ChefEntity({
    required this.name,
    required this.profileImage,
    required this.location,
    required this.isFollowing,
  });
}

class TabEntity {
  final String name;
  final bool active;

  TabEntity({
    required this.name,
    required this.active,
  });
}

class ServingEntity {
  final String serves;
  final int totalItems;

  ServingEntity({
    required this.serves,
    required this.totalItems,
  });
}

class IngredientEntity {
  final int id;
  final String name;
  final String quantity;
  final String icon;

  IngredientEntity({
    required this.id,
    required this.name,
    required this.quantity,
    required this.icon,
  });
}
