import 'package:flutter/material.dart';

import 'widgets.dart';
import 'words.dart';

class DemoList extends StatelessWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "重排列表2",
      builder: (context) => WordList(
        builder: (context, data) => SliverReorderableList(
          key: GlobalKey<SliverReorderableListState>(),
          onReorder: (oldIndex, newIndex) {
            // TODO
          },
          itemCount: getItemCount(data),
          itemBuilder: (context, index) => getListItem(data, index),
        ),
      ),
    );
  }
}
