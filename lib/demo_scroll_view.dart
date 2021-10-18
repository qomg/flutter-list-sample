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
      title: "滚动列表",
      builder: (context) => WordList(
        builder: (context, data) => SingleChildScrollView(
          child: Column(
            children: buildListItem(data),
          ),
        ),
      ),
    );
  }
}
