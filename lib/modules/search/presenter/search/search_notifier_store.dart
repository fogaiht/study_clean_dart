import 'package:flutter_triple/flutter_triple.dart';
import 'package:study_clean_dart/modules/search/domain/errors/errors.dart';

import '../../domain/entities/result_search.dart';
import '../../domain/usecases/search_by_text.dart';

class SearchNotifier extends NotifierStore<InvalidTextError, List<ResultSearch>> {
  final SearchByText usecase;

  SearchNotifier(this.usecase) : super([]);

  Future<void> fetchData(String searchText) async {
    setLoading(true);
    final result = await usecase(searchText);
    result.fold((l) => setError(l), (r) => update(r));
    setLoading(false);
  }
}
