import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wallet_app/offers/search/tile.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String>? _results;
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Search Users')),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
                style: Theme.of(context).textTheme.headline5,
                onChanged: _onSearchFieldChanged,
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Enter business name here",
                  hintStyle: placeholderTextFieldStyle,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                )),
          ),
          Expanded(
              child: (_results ?? []).isNotEmpty
                  ? GridView.count(
                  childAspectRatio: 1,
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(2.0),
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  children: _results!.map((r) => Tile(r)).toList())
                  : Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: _results == null
                      ? Container()
                      : Text("No results for '$_input'",
                      style: Theme.of(context).textTheme.caption))),
        ]));
  }

  _onSearchFieldChanged(String value) async {
    setState(() {
      _input = value;
      if (value.isEmpty) {
        _results = null;
      }
    });

    final results = await _searchUsers(value);

    setState(() {
      _results = results;
    });
  }

  Future<List<String>> _searchUsers(String name) async {

    final result = await Supabase.instance.client
        .from('benefits')
        .select('club, store, offer')
        .textSearch('store', "$name:*")
        .limit(100)
        .execute();

    if (result.error != null) {
      print('error: ${result.error.toString()}');
      return [];
    }

    final List<String> names = [];

    for (var v in ((result.data ?? []) as List<dynamic>)) {

      names.add("${v['club']} - ${v['store']}\n\n ${v['offer']}");
    }
    return names;
  }
}

final TextStyle placeholderTextFieldStyle =
TextStyle(color: Colors.grey.shade400);