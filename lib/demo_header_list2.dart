import 'package:flutter/material.dart';

import 'widgets.dart';
import 'words.dart';

class NameHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return newHeaderItem();
  }

  @override
  double get maxExtent => 48; // newHeaderItem 的尺寸

  @override
  double get minExtent => 48; // newHeaderItem 的尺寸

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class DemoList extends StatelessWidget {
  const DemoList({Key? key}) : super(key: key);

  List<Widget> buildHeaders(BuildContext context, bool innerBoxIsScrolled) {
    // 可以是一个头部列表
    return [
      SliverPersistentHeader(
        pinned: true,
        delegate: NameHeaderDelegate(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "固定头部",
      builder: (context) => WordList(
        builder: (context, data) => NestedScrollView(
          headerSliverBuilder: buildHeaders,
          body: CustomScrollView(
            slivers: [
              // SliverPadding 包裹添加间距
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => getListItem(data, index),
                  childCount: getItemCount(data),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
