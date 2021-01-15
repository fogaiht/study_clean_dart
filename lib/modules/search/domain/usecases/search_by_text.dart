import 'package:study_clean_dart/modules/search/domain/errors/errors.dart';
import 'package:study_clean_dart/modules/search/domain/repositories/search_repository.dart';

import '../entities/result_search.dart';
import 'package:dartz/dartz.dart';

abstract class SearchByText {
  Future<Either<Exception, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<Exception, List<ResultSearch>>> call(String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }

    return repository.search(searchText);
  }
}
