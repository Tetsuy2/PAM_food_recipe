import '../dto/feed_dto.dart';
import '../../domain/entities/feed_entity.dart';

class FeedMapper {
  static FeedEntity fromDto(FeedDto dto) {
    return FeedEntity(
      dto.recipes
          .map((e) => RecipeEntity(
                id: e.id,
                name: e.name,
                rating: e.rating,
                time: e.time,
                image: e.image,
                author: e.author,
                authorImage: e.authorImage,
              ))
          .toList(),
      dto.newRecipes
          .map((e) => RecipeEntity(
                id: e.id,
                name: e.name,
                rating: e.rating,
                time: e.time,
                image: e.image,
                author: e.author,
                authorImage: e.authorImage,
              ))
          .toList(),
    );
  }
}
