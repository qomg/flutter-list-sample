import 'package:flutter/material.dart';

import 'widgets.dart';
import 'words.dart';

class DemoList extends StatelessWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "Sliver固定高2",
      builder: (context) => WordList(
        builder: (context, data) => CustomScrollView(
          slivers: [
            SliverPrototypeExtentList(
              prototypeItem: newListItem(0, "PROTOTYPE", "ITEM"),
              delegate: SliverChildBuilderDelegate(
                (context, index) => getListItem(data, index),
                childCount: getItemCount(data),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
