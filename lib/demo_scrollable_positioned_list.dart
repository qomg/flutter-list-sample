import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'widgets.dart';
import 'words.dart';

class DemoList extends StatelessWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ItemScrollController();
    final listener = ItemPositionsListener.create();
    listener.itemPositions.addListener(() {
      final positions = listener.itemPositions.value.map((e) => e.index).join(",");
      debugPrint("OnItemPositionsListener: $positions");
    });
    return MyPage(
      title: "滚动到指定索引",
      floatingActionButtonBuilder: (context) => FloatingActionButton.small(
        child: const Text("19"),
        onPressed: () {
          // controller.jumpTo(index: 20);
          controller.scrollTo(
            index: 20,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOutCubic,
          );
        },
      ),
      builder: (context) => WordList(
        builder: (context, data) => ScrollablePositionedList.builder(
          itemScrollController: controller,
          itemPositionsListener: listener,
          itemCount: getItemCount(data),
          itemBuilder: (context, index) => getListItem(data, index),
        ),
      ),
    );
  }
}
