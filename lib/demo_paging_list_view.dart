import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'widgets.dart';
import 'words.dart';

class DemoList extends StatefulWidget {
  const DemoList({Key? key}) : super(key: key);

  @override createState() => _DemoListState();
}

class _DemoListState extends State<DemoList> {

  static const _pageSize = 30;

  late PagingController<int, WordPair> _pagingController;

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

  Future<void> fetchWords(int fromIndex) async {
    final page = fromIndex ~/ _pageSize;
    debugPrint("page = $page");
    try {
       final words = await generateWords(delay: 500, count: _pageSize);
       if (page >= 4) {
         _pagingController.appendLastPage(words);
       } else {
         _pagingController.appendPage(words, fromIndex + words.length);
       }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  void initState() {
    _pagingController = PagingController(firstPageKey: 0);
    _pagingController.addPageRequestListener((pageKey) {
      fetchWords(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "分页列表",
      builder: (context) => PagedListView<int, WordPair>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<WordPair>(
            itemBuilder: (context, item, index) => Username2(index: index, firstName: item.first, lastName: item.second,)
          ),
      ),
    );
  }
}
