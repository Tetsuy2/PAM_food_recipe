// lib/features/home/bloc/home_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_components/features/home/bloc/home_event.dart';
import 'package:ui_components/features/home/bloc/home_state.dart';
import 'package:ui_components/data/repositories/home_repository.dart';
import 'package:ui_components/data/models/home_models.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repo;
  HomeData? _raw;

  HomeBloc(this.repo) : super(const HomeLoading()) {
    on<HomeStarted>(_onStarted);
    on<CuisineChanged>(_onCuisine);
    on<SearchChanged>(_onSearch);
    on<BookmarkToggled>(_onBookmark);
  }

  Future<void> _onStarted(HomeStarted e, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
      _raw = await repo.fetchHome();
      emit(_buildLoaded(_raw!, selectedCuisine: _selectedCuisineFrom(_raw!)));
    } catch (err) {
      emit(HomeError(err.toString()));
    }
  }

  void _onCuisine(CuisineChanged e, Emitter<HomeState> emit) {
    if (_raw == null) return;
    final updatedCats = _raw!.categories
        .map((c) => c.copyWith(selected: c.name == e.name))
        .toList();

    _raw = _raw!.copyWith(categories: updatedCats);

    emit(_buildLoaded(_raw!, selectedCuisine: e.name, query: _currentQuery()));
  }

  void _onSearch(SearchChanged e, Emitter<HomeState> emit) {
    if (_raw == null) return;
    final selected = state is HomeLoaded
        ? (state as HomeLoaded).selectedCuisine
        : _selectedCuisineFrom(_raw!);
    emit(_buildLoaded(_raw!, selectedCuisine: selected, query: e.query));
  }

  void _onBookmark(BookmarkToggled e, Emitter<HomeState> emit) {
    if (_raw == null) return;

    final updatedRecipes = _raw!.recipes
        .map((r) =>
            r.id == e.recipeId ? r.copyWith(isBookmarked: !r.isBookmarked) : r)
        .toList();

    _raw = _raw!.copyWith(recipes: updatedRecipes);

    final loaded = state is HomeLoaded ? state as HomeLoaded : null;
    emit(_buildLoaded(
      _raw!,
      selectedCuisine: loaded?.selectedCuisine ?? _selectedCuisineFrom(_raw!),
      query: loaded?.query ?? '',
    ));
  }

  HomeLoaded _buildLoaded(HomeData data,
      {String? selectedCuisine, String? query}) {
    final sel = selectedCuisine ?? _selectedCuisineFrom(data);
    final q = (query ?? '').trim().toLowerCase();

    bool matches(String s) => q.isEmpty || s.toLowerCase().contains(q);

    final visibleRecipes = data.recipes.where((r) => matches(r.name)).toList();
    final visibleNew = data.newRecipes.where((r) => matches(r.name)).toList();

    return HomeLoaded(
      data: data,
      selectedCuisine: sel,
      query: q,
      visibleRecipes: visibleRecipes,
      visibleNewRecipes: visibleNew,
    );
  }

  String _selectedCuisineFrom(HomeData d) {
    if (d.categories.isEmpty) return '';
    final idx = d.categories.indexWhere((c) => c.selected);
    return (idx >= 0 ? d.categories[idx] : d.categories.first).name;
  }

  String _currentQuery() =>
      state is HomeLoaded ? (state as HomeLoaded).query : '';
}
