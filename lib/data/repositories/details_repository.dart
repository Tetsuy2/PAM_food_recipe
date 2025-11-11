import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ui_components/data/models/details_models.dart';

class DetailsRepository {
  Future<DetailsData> fetchDetails(int recipeId) async {
    final candidates = [
      'assets/data/details/$recipeId.json',
      'assets/data/details.json',
    ];

    String raw = '';
    for (final p in candidates) {
      try {
        raw = await rootBundle.loadString(p);
        if (raw.isNotEmpty) break;
      } catch (_) {}
    }
    if (raw.isEmpty) {
      throw StateError('Details file for $recipeId not found');
    }

    final decoded = jsonDecode(raw);

    if (decoded is Map<String, dynamic>) {
      return _fixMissingAssets(DetailsData.fromJson(decoded));
    }

    if (decoded is List) {
      final list = decoded
          .cast<Map>() // typed list of maps
          .map((m) => DetailsData.fromJson(m.cast<String, dynamic>()))
          .toList();

      final match = list.firstWhere(
        (d) => d.recipe.id == recipeId.toString(),
        orElse: () => list.first,
      );
      return _fixMissingAssets(match);
    }

    throw StateError('Invalid details format');
  }

  DetailsData _fixMissingAssets(DetailsData d) {
    final banner = d.recipe.image.isEmpty || d.recipe.image == '...'
        ? 'assets/food_banner.png'
        : d.recipe.image;

    final chefImg = d.chef.profileImage.isEmpty || d.chef.profileImage == '...'
        ? 'assets/profile.png'
        : d.chef.profileImage;

    String iconFor(String name, String icon) {
      if (icon.isNotEmpty && icon != '...') return icon;
      final n = name.toLowerCase();
      if (n.contains('tomato')) return 'assets/tomatos.png';
      if (n.contains('cabbage')) return 'assets/cabbage.png';
      if (n.contains('taco')) return 'assets/taco.png';
      if (n.contains('bread')) return 'assets/bread.png';
      return 'assets/bread.png';
    }

    return d.copyWith(
      recipe: d.recipe.copyWith(image: banner),
      chef: d.chef.copyWith(profileImage: chefImg),
      ingredients: [
        for (final i in d.ingredients) i.copyWith(icon: iconFor(i.name, i.icon))
      ],
    );
  }
}
