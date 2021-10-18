import 'package:flutter/material.dart';

import 'widgets.dart';
import 'words.dart';


class DemoList extends StatelessWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return MyPage(
      title: "多列表",
      builder: (context) => WordList(
        builder: (context, data) => CustomScrollView(
          // key: centerKey,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => getListItem(data, getItemCount(data) - index), // 最小只能取到 1
                childCount: getItemCount(data), // getItemCount(data) + 1
              ),
            ),
            SliverList(
              // key: centerKey,
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
