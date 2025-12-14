class FeedDto {
  final List<RecipeItemDto> recipes;
  final List<RecipeItemDto> newRecipes;

  FeedDto({required this.recipes, required this.newRecipes});

  factory FeedDto.fromJson(Map<String, dynamic> json) {
    return FeedDto(
      recipes: (json['recipes'] as List)
          .map((e) => RecipeItemDto.fromJson(e))
          .toList(),
      newRecipes: (json['new_recipes'] as List)
          .map((e) => RecipeItemDto.fromJson(e))
          .toList(),
    );
  }
}

class RecipeItemDto {
  final int id;
  final String name;
  final String time;
  final double rating;
  final String image;
  final String? author;
  final String? authorImage;

  RecipeItemDto({
    required this.id,
    required this.name,
    required this.time,
    required this.rating,
    required this.image,
    this.author,
    this.authorImage,
  });

  factory RecipeItemDto.fromJson(Map<String, dynamic> json) {
    return RecipeItemDto(
      id: json['id'],
      name: json['name'],
      rating: (json['rating']).toDouble(),
      time: json['time'],
      image: json['image'],
      author: json['author'],
      authorImage: json['author_image'],
    );
  }
}
