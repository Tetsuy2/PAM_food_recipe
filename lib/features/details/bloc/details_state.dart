import 'package:equatable/equatable.dart';
import 'package:ui_components/data/models/details_models.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();
  @override
  List<Object?> get props => [];
}

class DetailsLoading extends DetailsState {
  const DetailsLoading();
}

class DetailsError extends DetailsState {
  final String message;
  const DetailsError(this.message);
  @override
  List<Object?> get props => [message];
}

class DetailsLoaded extends DetailsState {
  final DetailsData data;
  const DetailsLoaded(this.data);
  @override
  List<Object?> get props => [data];
}
