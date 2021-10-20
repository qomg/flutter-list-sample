import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets.dart';
import 'words.dart';

class DemoList extends StatefulWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  createState() => _DemoListState();
}

class _DemoListState extends State<DemoList> {
  final _key = GlobalKey<_WordListViewState>();

  final _refreshController = RefreshController(initialRefresh: true);

  _onRefresh() async {
    debugPrint("_onRefresh");
    final words = await generateWords(delay: 500, count: 20);
    _refreshController.refreshCompleted();
    // _key.currentState?.setData(words);
    setData(words);
  }

  _onLoading() async {
    debugPrint("_onLoading");
    final words = await generateWords(delay: 500, count: 20);
    _refreshController.loadComplete();
    // _key.currentState?.addData(words);
    addData(words);
  }

  List<WordPair> data = [];

  invalidate() {
    if (mounted) {
      setState(() {});
    }
  }

  setData(List<WordPair> words) {
    data.clear();
    data.addAll(words);
    invalidate();
  }

  addData(List<WordPair> words) {
    data.addAll(words);
    invalidate();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "下拉刷新上划加载更多",
      builder: (context) => SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        // physics: const BouncingScrollPhysics(),
        // header: const WaterDropMaterialHeader(),
        // footer: const ClassicFooter(
        //   loadStyle: LoadStyle.ShowWhenLoading,
        //   completeDuration: Duration(milliseconds: 500),
        // ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => getListItem(data, index),
          itemCount: getItemCount(data),
        ),
        // child: WordListView(
        //   key: _key,
        // ),
      ),
    );
  }
}

@Deprecated("这种方式会导致无法刷新，刷新列表setState必须是SmartRefresher的父组件")
class WordListView extends StatefulWidget {
  const WordListView({Key? key}) : super(key: key);

  @override
  _WordListViewState createState() => _WordListViewState();
}

class _WordListViewState extends State<WordListView> {
  List<WordPair> data = [];

  invalidate() {
    if (mounted) {
      setState(() {});
    }
  }

  setData(List<WordPair> words) {
    data.clear();
    data.addAll(words);
    invalidate();
  }

  addData(List<WordPair> words) {
    data.addAll(words);
    invalidate();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => getListItem(data, index),
      itemCount: getItemCount(data),
    );
  }
}
