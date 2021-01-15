import 'package:dartz/dartz.dart';
import 'package:study_clean_dart/modules/search/domain/errors/errors.dart';
import 'package:study_clean_dart/modules/search/infra/datasources/search_datasource.dart';

import '../../domain/entities/result_search.dart';
import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);

  @override
  Future<Either<Exception, List<ResultSearch>>> search(String searchText) async {
    try {
      final result = await dataSource.getSearch(searchText);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
