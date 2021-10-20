import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'widgets.dart';
import 'words.dart';

class NameHeaderDelegate extends SliverPersistentHeaderDelegate {
  NameHeaderDelegate({this.tickerProvider});

  final TickerProvider? tickerProvider;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const ItemHeader();
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  TickerProvider? get vsync => tickerProvider;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration =>
      FloatingHeaderSnapConfiguration(
        curve: Curves.bounceInOut,
        duration: const Duration(milliseconds: 10),
      );
}

class DemoList extends StatefulWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  createState() => DemoListState();
}

class DemoListState extends State<DemoList>
    with SingleTickerProviderStateMixin {
  List<Widget> buildHeaders(BuildContext context, bool innerBoxIsScrolled) {
    return [
      // 2、Overlap
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverPersistentHeader(
          pinned: true,
          delegate: NameHeaderDelegate(tickerProvider: this),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "Overlap列表",
      builder: (context) => WordList(
        builder: (context, data) => NestedScrollView(
          headerSliverBuilder: buildHeaders,
          body: CustomScrollView(
            slivers: [
              // 1、Overlap
              Builder(
                builder: (context) => SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
              ),
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
