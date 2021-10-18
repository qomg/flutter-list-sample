import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'widgets.dart';
import 'words.dart';

class DemoList extends StatelessWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "重排列表2",
      builder: (context) => WordList(
        builder: (context, data) => ReorderableList(list: data ?? <WordPair>[]),
      ),
    );
  }
}

class ReorderableList extends StatelessWidget {
  const ReorderableList({Key? key, required this.list}) : super(key: key);

  final List<WordPair> list;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverReorderableList(
          key: GlobalKey<SliverReorderableListState>(),
          onReorder: (oldIndex, newIndex) {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = list.removeAt(oldIndex);
            list.insert(newIndex, item);
          },
          itemCount: list.length,
          itemBuilder: (context, index) => ReorderableDragStartListener(
            key: Key("$index"),
            index: index,
            child: Card(
              elevation: 0,
              child: newListItem(index, list[index].first, list[index].second),
            ),
          ),
        ),
      ],
    );
  }
}
