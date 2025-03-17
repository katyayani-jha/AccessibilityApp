import 'package:accessibility_app/cards_app/models/details.dart';
import 'package:flutter/material.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key, required this.searchCards});

  final List<CardDetails> searchCards;

  @override
  State<SearchBarApp> createState() => _SearchBarAppState(searchCards);
}

class _SearchBarAppState extends State<SearchBarApp> {
  final List<CardDetails> searchCards;
  _SearchBarAppState(this.searchCards);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Add Cards')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
        child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
            );
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(
              0,
              (int index) {
                final String item = searchCards[index].title.toString();
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
