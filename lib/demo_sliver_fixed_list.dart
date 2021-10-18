import 'package:flutter/material.dart';

import 'widgets.dart';
import 'words.dart';

class DemoList extends StatelessWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "Sliver固定高1",
      builder: (context) => WordList(
        builder: (context, data) => CustomScrollView(
          slivers: [
            // FIXME 第一行高度有问题
            SliverFixedExtentList(
              itemExtent: 100,
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
