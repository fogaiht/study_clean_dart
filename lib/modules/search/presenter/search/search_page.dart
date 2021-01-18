import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:study_clean_dart/modules/search/domain/errors/errors.dart';

import '../../domain/entities/result_search.dart';
import 'search_notifier_store.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchNotifier = Modular.get<SearchNotifier>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GithubSearch")),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Search...",
                ),
                onChanged: _searchNotifier.fetchData,
              ),
            ),
            Expanded(
              child: ScopedBuilder<SearchNotifier, InvalidTextError, List<ResultSearch>>(
                store: _searchNotifier,
                onLoading: (context) => Center(child: CircularProgressIndicator()),
                onError: (context, error) => Center(child:Text(error.message)),
                onState: (context, state) {
                  return ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (_, index) {
                      final item = state[index];
                      return ListTile(title: Text(item?.avatarUrl ?? "asfasdgds"));
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
