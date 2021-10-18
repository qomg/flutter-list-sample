import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'widgets.dart';
import 'words.dart';

class DemoList extends StatelessWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "重排列表1",
      builder: (context) => WordList(
        builder: (context, data) => ReorderableList(data: data),
      ),
    );
  }
}

class ReorderableList extends StatefulWidget {
  const ReorderableList({Key? key, required this.data}) : super(key: key);

  final List<WordPair>? data;

  @override
  _ReorderableListState createState() => _ReorderableListState();
}

class _ReorderableListState extends State<ReorderableList> {
  late List<WordPair> list;

  @override
  void initState() {
    list = widget.data?.toList() ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      onReorder: (oldIndex, newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = list.removeAt(oldIndex);
        list.insert(newIndex, item);
      },
      itemCount: list.length,
      itemBuilder: (context, index) =>
          newListItem(index, list[index].first, list[index].second),
    );
  }
}
