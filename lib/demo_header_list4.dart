import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:english_words/english_words.dart';

import 'widgets.dart';
import 'words.dart';

class NameHeaderDelegate extends SliverPersistentHeaderDelegate {
  NameHeaderDelegate({this.tickerProvider, this.title});

  final TickerProvider? tickerProvider;

  final String? title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ItemHeader(text: title ?? "姓名");
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
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

class SliverHeader extends StatefulWidget {
  const SliverHeader({Key? key, this.tickerProvider}) : super(key: key);

  final TickerProvider? tickerProvider;

  @override
  _SliverHeaderState createState() => _SliverHeaderState();
}

class _SliverHeaderState extends State<SliverHeader> {
  String? _title;

  String? get title => _title;

  set title(String? value) {
    debugPrint("title: $_title, value: $value, mounted: $mounted");
    _title = value;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: NameHeaderDelegate(
            tickerProvider: widget.tickerProvider, title: title),
      ),
    );
  }
}

class DemoList extends StatefulWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  createState() => DemoListState();
}

class DemoListState extends State<DemoList>
    with SingleTickerProviderStateMixin {
  late GlobalKey<_SliverHeaderState> sliverHeaderKey;
  late ScrollController _controller;

  List<WordPair>? data;

  List<Widget> buildHeaders(BuildContext context, bool innerBoxIsScrolled) {
    return [
      // 2、Overlap
      SliverHeader(key: sliverHeaderKey, tickerProvider: this)
    ];
  }

  Widget wrapNotification(Widget child) {
    return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            onScrollEnd();
          }
          return true;
        },
        child: child);
  }

  Widget newScrollView(List<WordPair>? data) {
    return NestedScrollView(
      physics: const ClampingScrollPhysics(),
      headerSliverBuilder: buildHeaders,
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          // 1、Overlap
          Builder(
            builder: (context) => SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
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
    );
  }

  onScrollEnd() {
    // 列表项高度 72
    // 如果列表项高度不统一，不适用
    final index = _controller.position.pixels ~/ 72;
    final item = data?.elementAt(index);
    if (item != null) {
      sliverHeaderKey.currentState?.title = item.toString();
    }
  }

  @override
  void initState() {
    sliverHeaderKey = GlobalKey<_SliverHeaderState>();
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "滚动监听",
      builder: (context) => WordList(
        builder: (context, data) {
          this.data = data;
          return wrapNotification(newScrollView(data));
        },
      ),
    );
  }
}
