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
    return newHeaderItem(title ?? "姓名");
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
        delegate: NameHeaderDelegate(tickerProvider: widget.tickerProvider, title: title),
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
    return NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            onScrollEnd();
          }
          return false;
        },
        child: child);
  }

  Widget newScrollView(List<WordPair>? data) {
    return NestedScrollView(
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
          // SliverFixedExtentList(
          //   itemExtent: 60,
            delegate: SliverChildBuilderDelegate(
              (context, index) => getListItem(data, index),
              // (context, index) => getListItem(data, index, 1),
              childCount: getItemCount(data),
            ),
          ),
        ],
      ),
    );
  }

  onScrollEnd() {
    // FIXME
    final pixels = _controller.position.pixels - 48;
    final index = pixels ~/ 60;
    final item = data?.elementAt(index);
    if (item != null) {
      sliverHeaderKey.currentState?.title = item.toString();
    }
  }

  @override
  void initState() {
    sliverHeaderKey = GlobalKey<_SliverHeaderState>();
    _controller = ScrollController(initialScrollOffset: 48);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "Overlap列表",
      builder: (context) => WordList(
        builder: (context, data) {
          this.data = data;
          return wrapNotification(newScrollView(data));
        },
      ),
    );
  }
}
