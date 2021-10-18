import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';
import 'words.dart';

class DemoList extends StatelessWidget {
  const DemoList({Key? key}) : super(key: key);

  List<Widget> buildListItem(List<WordPair>? data) {
    final items = <Widget>[];
    if (data != null && data.isNotEmpty) {
      final size = getItemCount(data);
      for (var i = 0; i < size; i++) {
        items.add(getListItem(data, i));
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "简单列表1",
      builder: (context) => WordList(
        builder: (context, data) => ListView(
          children: buildListItem(data),
          // shrinkWrap: true,
          // itemExtent: 50,
          // prototypeItem: newListItem(0, "firstName", "lastName"),
        ),
      ),
    );
  }
}
