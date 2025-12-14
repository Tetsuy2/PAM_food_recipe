import '../../domain/entities/details_entity.dart';
import '../dto/details_dto.dart';

//transformă DTO în entități Domain

class DetailsMapper {
  static DetailsEntity fromDto(DetailsDto d) {
    return DetailsEntity(
      recipe: RecipeDetailsEntity(
        id: d.recipe.id,
        title: d.recipe.title,
        image: d.recipe.image,
        rating: d.recipe.rating,
        reviews: d.recipe.reviews,
        cookTime: d.recipe.cookTime,
        isBookmarked: d.recipe.isBookmarked,
      ),
      chef: ChefEntity(
        name: d.chef.name,
        profileImage: d.chef.profileImage,
        location: d.chef.location,
        isFollowing: d.chef.isFollowing,
      ),
      tabs:
          d.tabs.map((t) => TabEntity(name: t.name, active: t.active)).toList(),
      serving: ServingEntity(
        serves: d.serving.serves,
        totalItems: d.serving.totalItems,
      ),
      ingredients: d.ingredients
          .map(
            (i) => IngredientEntity(
              id: i.id,
              name: i.name,
              quantity: i.quantity,
              icon: i.icon,
            ),
          )
          .toList(),
    );
  }
}
