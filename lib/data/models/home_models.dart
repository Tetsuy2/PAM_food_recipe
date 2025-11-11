// lib/data/models/home_models.dart

class User {
  final String name;
  final String profileImage;
  final String greeting;

  const User({
    required this.name,
    required this.profileImage,
    required this.greeting,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: (json['name'] ?? '').toString(),
        profileImage:
            (json['profile_image'] ?? json['avatar_image'] ?? '').toString(),
        greeting: (json['greeting'] ?? '').toString(),
      );

  User copyWith({String? name, String? profileImage, String? greeting}) => User(
        name: name ?? this.name,
        profileImage: profileImage ?? this.profileImage,
        greeting: greeting ?? this.greeting,
      );
}

class Category {
  final int id;
  final String name;
  final bool selected;

  const Category({
    required this.id,
    required this.name,
    required this.selected,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: int.tryParse((json['id'] ?? '').toString()) ?? 0,
        name: (json['name'] ?? '').toString(),
        selected: json['selected'] == true,
      );

  Category copyWith({int? id, String? name, bool? selected}) => Category(
        id: id ?? this.id,
        name: name ?? this.name,
        selected: selected ?? this.selected,
      );
}

class RecipeItem {
  final String id;
  final String title;
  final String image;
  final double rating;
  final String timeLabel; // e.g. "15 Mins"
  final bool isBookmarked;

  const RecipeItem({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.timeLabel,
    required this.isBookmarked,
  });

  // UI compatibility
  String get name => title;
  String get time => timeLabel;

  /// Parses the first integer in `timeLabel` (e.g., "15 Mins" -> 15).
  int get timeMinutes {
    final m = RegExp(r'\d+').firstMatch(timeLabel);
    return int.tryParse(m?.group(0) ?? '') ?? 0;
  }

  factory RecipeItem.fromJson(Map<String, dynamic> json) => RecipeItem(
        id: (json['id'] ?? '').toString(),
        title: (json['name'] ?? json['title'] ?? '').toString(),
        image: (json['image'] ?? '').toString(),
        rating: (json['rating'] is int)
            ? (json['rating'] as int).toDouble()
            : (json['rating'] as num?)?.toDouble() ?? 0.0,
        timeLabel: (json['time'] ?? json['duration'] ?? '').toString(),
        isBookmarked:
            json['is_bookmarked'] == true || json['isBookmarked'] == true,
      );

  RecipeItem copyWith({
    String? id,
    String? title,
    String? image,
    double? rating,
    String? timeLabel,
    bool? isBookmarked,
  }) =>
      RecipeItem(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        rating: rating ?? this.rating,
        timeLabel: timeLabel ?? this.timeLabel,
        isBookmarked: isBookmarked ?? this.isBookmarked,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'rating': rating,
        'time': timeLabel,
        'is_bookmarked': isBookmarked,
      };
}

class NewRecipeItem {
  final String id;
  final String title;
  final String image;
  final String author;
  final String authorImage;
  final String timeLabel;

  const NewRecipeItem({
    required this.id,
    required this.title,
    required this.image,
    required this.author,
    required this.authorImage,
    required this.timeLabel,
  });

  String get name => title;
  String get time => timeLabel;

  int get timeMinutes {
    final m = RegExp(r'\d+').firstMatch(timeLabel);
    return int.tryParse(m?.group(0) ?? '') ?? 0;
  }

  factory NewRecipeItem.fromJson(Map<String, dynamic> json) => NewRecipeItem(
        id: (json['id'] ?? '').toString(),
        title: (json['name'] ?? json['title'] ?? '').toString(),
        image: (json['image'] ?? '').toString(),
        author: (json['author'] ?? '').toString(),
        authorImage: (json['author_image'] ?? '').toString(),
        timeLabel: (json['time'] ?? json['duration'] ?? '').toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'author': author,
        'author_image': authorImage,
        'time': timeLabel,
      };
}

class HomeData {
  final User user;
  final String searchPlaceholder;
  final List<Category> categories;
  final List<RecipeItem> recipes;
  final List<NewRecipeItem> newRecipes;

  const HomeData({
    required this.user,
    required this.searchPlaceholder,
    required this.categories,
    required this.recipes,
    required this.newRecipes,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic>? filters = json['filters'] is Map
        ? (json['filters'] as Map).cast<String, dynamic>()
        : null;

    final List<Category> cats = ((filters?['categories'] as List?) ?? const [])
        .map((e) => Category.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    final List<RecipeItem> recs = ((json['recipes'] as List?) ?? const [])
        .map((e) => RecipeItem.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    final List<NewRecipeItem> newRecs = ((json['new_recipes'] as List?) ??
            const [])
        .map((e) => NewRecipeItem.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    return HomeData(
      user: User.fromJson(
        (json['user'] is Map
            ? (json['user'] as Map).cast<String, dynamic>()
            : <String, dynamic>{}),
      ),
      searchPlaceholder:
          (filters?['search_placeholder'] ?? json['search_placeholder'] ?? '')
              .toString(),
      categories: cats,
      recipes: recs,
      newRecipes: newRecs,
    );
  }

  HomeData copyWith({
    User? user,
    String? searchPlaceholder,
    List<Category>? categories,
    List<RecipeItem>? recipes,
    List<NewRecipeItem>? newRecipes,
  }) =>
      HomeData(
        user: user ?? this.user,
        searchPlaceholder: searchPlaceholder ?? this.searchPlaceholder,
        categories: categories ?? this.categories,
        recipes: recipes ?? this.recipes,
        newRecipes: newRecipes ?? this.newRecipes,
      );
}
