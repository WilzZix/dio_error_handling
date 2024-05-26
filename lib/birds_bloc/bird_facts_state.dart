part of 'bird_facts_cubit.dart';

sealed class BirdFactsState extends Equatable {
  const BirdFactsState();
}

final class BirdFactsInitial extends BirdFactsState {
  @override
  List<Object> get props => [];
}

class BirdFactsLoadedState extends BirdFactsState {
  final List<BirdFact> data;

  const BirdFactsLoadedState(this.data);

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

class BirdFactsLoadError extends BirdFactsState {
  final String msg;

  const BirdFactsLoadError(this.msg);

  @override
  List<Object?> get props => [msg];
}

class BirdFactsLoadingState extends BirdFactsState {
  @override
  List<Object?> get props => [];
}
