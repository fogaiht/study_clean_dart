import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:study_clean_dart/modules/search/domain/errors/errors.dart';
import 'package:study_clean_dart/modules/search/external/datasources/github_datasource.dart';

import '../../utils/payloads.dart';


class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);
  test('deve retornar uma lista de ResultSearchModel', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(data: githubSearchPayload, statusCode: 200));

    final result = datasource.getSearch("searchText");
    expect(result, completes);
  });
  test('deve retornar um erro se o statusCode diferente 200', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(data: null, statusCode: 401));

    var result = datasource.getSearch("searchText");
    expect(result, throwsA(isA<DataSourceError>()));
  });
}
