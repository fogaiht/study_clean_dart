import 'package:dartz/dartz.dart';
import 'package:study_clean_dart/modules/search/domain/entities/result_search.dart';

abstract class SearchRepository {
  Future<Either<Exception, List<ResultSearch>>> search(String searchText);
}
