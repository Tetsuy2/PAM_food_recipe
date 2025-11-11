// lib/features/home/bloc/home_event.dart
import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class HomeStarted extends HomeEvent {
  const HomeStarted();
}

class CuisineChanged extends HomeEvent {
  final String name;
  const CuisineChanged(this.name);
  @override
  List<Object?> get props => [name];
}

class SearchChanged extends HomeEvent {
  final String query;
  const SearchChanged(this.query);
  @override
  List<Object?> get props => [query];
}

/// Use String here to match RecipeItem.id and avoid type-equality warnings.
class BookmarkToggled extends HomeEvent {
  final String recipeId;
  const BookmarkToggled(this.recipeId);
  @override
  List<Object?> get props => [recipeId];
}
