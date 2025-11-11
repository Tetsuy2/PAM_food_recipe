// lib/features/home/bloc/home_state.dart
import 'package:equatable/equatable.dart';
import '../../../data/models/home_models.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
  @override
  List<Object?> get props => [message];
}

class HomeLoaded extends HomeState {
  final HomeData data;
  final String selectedCuisine;
  final String query;
  final List<RecipeItem> visibleRecipes;
  final List<NewRecipeItem> visibleNewRecipes;

  const HomeLoaded({
    required this.data,
    required this.selectedCuisine,
    required this.query,
    required this.visibleRecipes,
    required this.visibleNewRecipes,
  });

  HomeLoaded copyWith({
    HomeData? data,
    String? selectedCuisine,
    String? query,
    List<RecipeItem>? visibleRecipes,
    List<NewRecipeItem>? visibleNewRecipes,
  }) =>
      HomeLoaded(
        data: data ?? this.data,
        selectedCuisine: selectedCuisine ?? this.selectedCuisine,
        query: query ?? this.query,
        visibleRecipes: visibleRecipes ?? this.visibleRecipes,
        visibleNewRecipes: visibleNewRecipes ?? this.visibleNewRecipes,
      );

  @override
  List<Object?> get props =>
      [data, selectedCuisine, query, visibleRecipes, visibleNewRecipes];
}

