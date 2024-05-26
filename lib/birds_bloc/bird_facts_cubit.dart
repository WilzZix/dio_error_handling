import 'package:bloc/bloc.dart';
import 'package:dio_test/bird_fact_model.dart';
import 'package:dio_test/birds_repository.dart';
import 'package:equatable/equatable.dart';

part 'bird_facts_state.dart';

class BirdFactsCubit extends Cubit<BirdFactsState> {
  BirdFactsCubit() : super(BirdFactsInitial());
  BirdsRepository repository = BirdsRepository();

  void getBirdFacts() async {
    emit(BirdFactsLoadingState());
    final data = await repository.getFactsAboutBirds();
    data.fold((l) {
      emit(BirdFactsLoadError(l.message));
    }, (r) {
      emit(BirdFactsLoadedState(r));
    });
  }
}
