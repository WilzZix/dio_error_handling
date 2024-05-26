import 'package:dio_test/error_handler.dart';
import 'package:either_dart/either.dart';
import 'bird_fact_model.dart';

abstract class IBirdsFacts {
  Future<Either<Failure, List<BirdFact>>> getFactsAboutBirds();
}
