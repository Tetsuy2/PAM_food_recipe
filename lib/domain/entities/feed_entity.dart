class FeedEntity {
  final List<RecipeEntity> recipes;
  final List<RecipeEntity> newRecipes;

  FeedEntity(this.recipes, this.newRecipes);
}

class RecipeEntity {
  final int id;
  final String name;
  final double rating;
  final String time;
  final String image;
  final String? author;
  final String? authorImage;

  RecipeEntity({
    required this.id,
    required this.name,
    required this.rating,
    required this.time,
    required this.image,
    this.author,
    this.authorImage,
  });
}
