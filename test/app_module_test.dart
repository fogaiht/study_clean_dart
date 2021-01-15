import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:study_clean_dart/app_module.dart';
import 'package:study_clean_dart/modules/search/domain/entities/result_search.dart';
import 'package:study_clean_dart/modules/search/domain/usecases/search_by_text.dart';

import 'modules/search/utils/payloads.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  initModule(AppModule(), changeBinds: [Bind<Dio>((i) => dio)]);

  test("Deve recuperar o usecase sem erro", () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });
  test("Deve trazer uma lista de ResultSearch", () async {
    when(dio.get(any)).thenAnswer((_) async => Response(data: githubSearchPayload, statusCode: 200));
    
    final usecase = Modular.get<SearchByText>();
    final result = await usecase("Fogaiht");

    expect(result | null, isA<List<ResultSearch>>());
  });
}
