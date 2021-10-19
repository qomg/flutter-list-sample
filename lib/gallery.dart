import 'package:flutter/material.dart';

import 'widgets.dart';
import 'demo_scroll_view.dart' as scroll_view1;
import 'demo_list_view1.dart' as list_view1;
import 'demo_list_view2.dart' as list_view2;
import 'demo_list_view3.dart' as list_view3;
import 'demo_list_view4.dart' as list_view4;
import 'demo_sliver_list.dart' as sliver_view1;
import 'demo_sliver_fixed_list.dart' as sliver_view2;
import 'demo_sliver_prototype_list.dart' as sliver_view3;
import 'demo_multi_list.dart' as multi_list;
import 'demo_header_list1.dart' as header_list1;
import 'demo_header_list2.dart' as header_list2;
import 'demo_header_list3.dart' as header_list3;
import 'demo_header_list4.dart' as header_list4;
import 'demo_reorder_list1.dart' as reorder_list1;
import 'demo_reorder_list2.dart' as reorder_list2;
import 'demo_staggered_grid_view.dart' as staggered_list;
import 'demo_scrollable_positioned_list.dart' as positioned_list;

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

  Widget buildButton(String text, BuildContext context, Widget child) {
    return newButton(
      text: text,
      context: context,
      builder: (context) => child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "示例",
      builder: (context) => Container(
        color: Colors.grey[200],
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          children: [
            buildButton("滚动列表1", context, const scroll_view1.DemoList()),
            buildButton("滚动列表2", context, const positioned_list.DemoList()),
            buildButton("简单列表1", context, const list_view1.DemoList()),
            buildButton("简单列表2", context, const list_view2.DemoList()),
            buildButton("简单列表3", context, const list_view3.DemoList()),
            buildButton("简单列表4", context, const list_view4.DemoList()),
            buildButton("简单列表5", context, const sliver_view1.DemoList()),
            buildButton("Sliver固定高1", context, const sliver_view2.DemoList()),
            buildButton("Sliver固定高2", context, const sliver_view3.DemoList()),
            buildButton("多列表", context, const multi_list.DemoList()),
            buildButton("带头部", context, const header_list1.DemoList()),
            buildButton("固定头部", context, const header_list2.DemoList()),
            buildButton("Overlap列表", context, const header_list3.DemoList()),
            buildButton("滚动监听", context, const header_list4.DemoList()),
            buildButton("重排列表1", context, const reorder_list1.DemoList()),
            buildButton("重排列表2", context, const reorder_list2.DemoList()),
            buildButton("瀑布流", context, const staggered_list.DemoList()),
          ],
        ),
      ),
    );
  }
}
