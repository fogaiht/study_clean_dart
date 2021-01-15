import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:study_clean_dart/modules/search/domain/entities/result_search.dart';
import 'package:study_clean_dart/modules/search/domain/errors/errors.dart';
import 'package:study_clean_dart/modules/search/infra/datasources/search_datasource.dart';
import 'package:study_clean_dart/modules/search/infra/models/result_search_model.dart';
import 'package:study_clean_dart/modules/search/infra/repositories/search_repository_impl.dart';

class SearchDataSourceMock extends Mock implements SearchDataSource {}

main() {
  final dataSource = SearchDataSourceMock();
  final repository = SearchRepositoryImpl(dataSource);

  test('Deve retornar uma lista de ResultSearchModel', () async {
    when(dataSource.getSearch(any)).thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await repository.search("Fogaiht");
    expect(result | null, isA<List<ResultSearch>>());
  });
  test('Deve retornar um DataSourceError se o dataSource falhar', () async {
    when(repository.search(any)).thenThrow(Exception());

    final result = await repository.search("Fogaiht");
    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
