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
              prototypeItem: const Username2(
                index: 0,
                firstName: "PROTOTYPE",
                lastName: "ITEM",
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Username2(
                  index: index,
                  firstName: data![index].first,
                  lastName: data[index].second,
                ),
                childCount: getItemCount0(data),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
