import 'package:equatable/equatable.dart';

sealed class DetailsEvent extends Equatable {
  const DetailsEvent();
  @override
  List<Object?> get props => [];
}

class DetailsRequested extends DetailsEvent {
  final int recipeId;
  const DetailsRequested(this.recipeId);
  @override
  List<Object?> get props => [recipeId];
}

class DetailsBookmarkToggled extends DetailsEvent {
  const DetailsBookmarkToggled();
}

class DetailsFollowToggled extends DetailsEvent {
  const DetailsFollowToggled();
}
