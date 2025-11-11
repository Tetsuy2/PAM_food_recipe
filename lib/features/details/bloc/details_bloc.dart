import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_components/features/details/bloc/details_event.dart';
import 'package:ui_components/features/details/bloc/details_state.dart';
import 'package:ui_components/data/models/details_models.dart';
import 'package:ui_components/data/repositories/details_repository.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final DetailsRepository repo;
  DetailsData? _raw;

  DetailsBloc(this.repo) : super(const DetailsLoading()) {
    on<DetailsRequested>(_onRequested);
    on<DetailsBookmarkToggled>(_onBookmark);
    on<DetailsFollowToggled>(_onFollow);
  }

  Future<void> _onRequested(
      DetailsRequested e, Emitter<DetailsState> emit) async {
    emit(const DetailsLoading());
    try {
      _raw = await repo.fetchDetails(e.recipeId);
      emit(DetailsLoaded(_raw!));
    } catch (err) {
      emit(DetailsError(err.toString()));
    }
  }

  void _onBookmark(DetailsBookmarkToggled e, Emitter<DetailsState> emit) {
    if (_raw == null) return;
    _raw = _raw!.copyWith(
      recipe: _raw!.recipe.copyWith(isBookmarked: !_raw!.recipe.isBookmarked),
    );
    emit(DetailsLoaded(_raw!));
  }

  void _onFollow(DetailsFollowToggled e, Emitter<DetailsState> emit) {
    if (_raw == null) return;
    _raw = _raw!.copyWith(
      chef: _raw!.chef.copyWith(isFollowing: !_raw!.chef.isFollowing),
    );
    emit(DetailsLoaded(_raw!));
  }
}
