class RecipeDetail {
  final String id;
  final String title;
  final String image; // banner
  final double rating;
  final String reviewsLabel; // e.g. "13k Reviews"
  final String cookTimeLabel; // e.g. "20 min"
  final bool isBookmarked;

  const RecipeDetail({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.reviewsLabel,
    required this.cookTimeLabel,
    required this.isBookmarked,
  });

  factory RecipeDetail.fromJson(Map<String, dynamic> json) => RecipeDetail(
        id: (json['id'] ?? '').toString(),
        title: (json['title'] ?? '').toString(),
        image: (json['image'] ?? '').toString(),
        rating: (json['rating'] is int)
            ? (json['rating'] as int).toDouble()
            : (json['rating'] as num?)?.toDouble() ?? 0.0,
        reviewsLabel: (json['reviews'] ?? '').toString(),
        cookTimeLabel: (json['cook_time'] ?? json['time'] ?? '').toString(),
        isBookmarked: json['is_bookmarked'] == true ||
            json['isBookmarked'] == true ||
            json['bookmarked'] == true,
      );

  RecipeDetail copyWith({
    String? id,
    String? title,
    String? image,
    double? rating,
    String? reviewsLabel,
    String? cookTimeLabel,
    bool? isBookmarked,
  }) =>
      RecipeDetail(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        rating: rating ?? this.rating,
        reviewsLabel: reviewsLabel ?? this.reviewsLabel,
        cookTimeLabel: cookTimeLabel ?? this.cookTimeLabel,
        isBookmarked: isBookmarked ?? this.isBookmarked,
      );
}

class ChefDetail {
  final String name;
  final String profileImage;
  final String location;
  final bool isFollowing;

  const ChefDetail({
    required this.name,
    required this.profileImage,
    required this.location,
    required this.isFollowing,
  });

  factory ChefDetail.fromJson(Map<String, dynamic> json) => ChefDetail(
        name: (json['name'] ?? '').toString(),
        profileImage: (json['profile_image'] ?? '').toString(),
        location: (json['location'] ?? '').toString(),
        isFollowing: json['is_following'] == true || json['followed'] == true,
      );

  ChefDetail copyWith({
    String? name,
    String? profileImage,
    String? location,
    bool? isFollowing,
  }) =>
      ChefDetail(
        name: name ?? this.name,
        profileImage: profileImage ?? this.profileImage,
        location: location ?? this.location,
        isFollowing: isFollowing ?? this.isFollowing,
      );
}

class IngredientItem {
  final String name;
  final String quantity;
  final String icon; // asset path

  const IngredientItem({
    required this.name,
    required this.quantity,
    this.icon = '',
  });

  factory IngredientItem.fromJson(Map<String, dynamic> json) => IngredientItem(
        name: (json['name'] ?? '').toString(),
        quantity: (json['quantity'] ?? '').toString(),
        icon: (json['icon'] ?? '').toString(),
      );

  IngredientItem copyWith({String? name, String? quantity, String? icon}) =>
      IngredientItem(
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        icon: icon ?? this.icon,
      );
}

class DetailsData {
  final RecipeDetail recipe;
  final ChefDetail chef;
  final List<IngredientItem> ingredients;
  final List<String> steps;

  const DetailsData({
    required this.recipe,
    required this.chef,
    required this.ingredients,
    required this.steps,
  });

  factory DetailsData.fromJson(Map<String, dynamic> json) => DetailsData(
        recipe: RecipeDetail.fromJson(
            ((json['recipe'] ?? const {}) as Map).cast<String, dynamic>()),
        chef: ChefDetail.fromJson(
            ((json['chef'] ?? const {}) as Map).cast<String, dynamic>()),
        ingredients: ((json['ingredients'] as List?) ?? const [])
            .map((e) =>
                IngredientItem.fromJson((e as Map).cast<String, dynamic>()))
            .toList(),
        steps: ((json['steps'] as List?) ?? const []).map((e) => '$e').toList(),
      );

  DetailsData copyWith({
    RecipeDetail? recipe,
    ChefDetail? chef,
    List<IngredientItem>? ingredients,
    List<String>? steps,
  }) =>
      DetailsData(
        recipe: recipe ?? this.recipe,
        chef: chef ?? this.chef,
        ingredients: ingredients ?? this.ingredients,
        steps: steps ?? this.steps,
      );
}
