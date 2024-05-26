import 'package:dio_test/bird_fact_model.dart';
import 'package:dio_test/dio_client.dart';
import 'package:dio_test/error_handler.dart';
import 'package:dio_test/i_birds.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class BirdsRepository extends IBirdsFacts {
  @override
  Future<Either<Failure, List<BirdFact>>> getFactsAboutBirds() async {
    try {
      final Response response = await DioClient.dio.get('/breeds');
      return Right(BirdFact.fetchData(response.data));
    } catch (e) {
      return Left(ErrorHandler.handle(e.toString()).failure);
    }
  }
}
