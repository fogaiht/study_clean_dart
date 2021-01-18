import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:study_clean_dart/modules/search/domain/entities/result_search.dart';
import 'package:study_clean_dart/modules/search/domain/usecases/search_by_text.dart';
import 'package:study_clean_dart/modules/search/presenter/search/search_notifier_store.dart';

class SearchByTextMock extends Mock implements SearchByText {}

main() {
  final usecase = SearchByTextMock();
  final searchStore = SearchNotifier(usecase);
  test("Deve retornar os estados na ordem correta", () {
    when(usecase(any)).thenAnswer((_) async => Right(<ResultSearch>[]));

    expect(searchStore.state, isA<List<ResultSearch>>());
  });
}
