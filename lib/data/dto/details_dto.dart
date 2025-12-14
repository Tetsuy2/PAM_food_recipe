// pachete json desfăcute
class DetailsDto {
  final RecipeDetailsDto recipe;
  final ChefDto chef;
  final List<TabDto> tabs;
  final ServingDto serving;
  final List<IngredientDto> ingredients;

  DetailsDto({
    required this.recipe,
    required this.chef,
    required this.tabs,
    required this.serving,
    required this.ingredients,
  });

  factory DetailsDto.fromJson(Map<String, dynamic> json) {
    return DetailsDto(
      recipe: RecipeDetailsDto.fromJson(json['recipe']),
      chef: ChefDto.fromJson(json['chef']),
      tabs: (json['tabs'] as List).map((e) => TabDto.fromJson(e)).toList(),
      serving: ServingDto.fromJson(json['serving']),
      ingredients: (json['ingredients'] as List)
          .map((e) => IngredientDto.fromJson(e))
          .toList(),
    );
  }
}

class RecipeDetailsDto {
  final int id;
  final String title;
  final String image;
  final double rating;
  final String reviews;
  final String cookTime;
  final bool isBookmarked;

  RecipeDetailsDto({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.cookTime,
    required this.isBookmarked,
  });

  factory RecipeDetailsDto.fromJson(Map<String, dynamic> json) {
    return RecipeDetailsDto(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'],
      cookTime: json['cook_time'],
      isBookmarked: json['is_bookmarked'],
    );
  }
}

class ChefDto {
  final String name;
  final String profileImage;
  final String location;
  final bool isFollowing;

  ChefDto({
    required this.name,
    required this.profileImage,
    required this.location,
    required this.isFollowing,
  });

  factory ChefDto.fromJson(Map<String, dynamic> json) {
    return ChefDto(
      name: json['name'],
      profileImage: json['profile_image'],
      location: json['location'],
      isFollowing: json['is_following'],
    );
  }
}

class TabDto {
  final String name;
  final bool active;

  TabDto({
    required this.name,
    required this.active,
  });

  factory TabDto.fromJson(Map<String, dynamic> json) {
    return TabDto(
      name: json['name'],
      active: json['active'],
    );
  }
}

class ServingDto {
  final String serves;
  final int totalItems;

  ServingDto({
    required this.serves,
    required this.totalItems,
  });

  factory ServingDto.fromJson(Map<String, dynamic> json) {
    return ServingDto(
      serves: json['serves'],
      totalItems: json['total_items'],
    );
  }
}

class IngredientDto {
  final int id;
  final String name;
  final String quantity;
  final String icon;

  IngredientDto({
    required this.id,
    required this.name,
    required this.quantity,
    required this.icon,
  });

  factory IngredientDto.fromJson(Map<String, dynamic> json) {
    return IngredientDto(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      icon: json['icon'],
    );
  }
}
