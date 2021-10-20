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
import 'demo_refresh_loadmore_list.dart' as loadable_list;

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

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
            DemoButton(
              text: "滚动列表1",
              builder: (context) => const scroll_view1.DemoList(),
            ),
            DemoButton(
              text: "滚动列表2",
              builder: (context) => const positioned_list.DemoList(),
            ),
            DemoButton(
              text: "简单列表1",
              builder: (context) => const list_view1.DemoList(),
            ),
            DemoButton(
              text: "简单列表2",
              builder: (context) => const list_view2.DemoList(),
            ),
            DemoButton(
              text: "简单列表3",
              builder: (context) => const list_view3.DemoList(),
            ),
            DemoButton(
              text: "简单列表4",
              builder: (context) => const list_view4.DemoList(),
            ),
            DemoButton(
              text: "简单列表5",
              builder: (context) => const sliver_view1.DemoList(),
            ),
            DemoButton(
              text: "Sliver固定高1",
              builder: (context) => const sliver_view2.DemoList(),
            ),
            DemoButton(
              text: "Sliver固定高2",
              builder: (context) => const sliver_view3.DemoList(),
            ),
            DemoButton(
              text: "多列表",
              builder: (context) => const multi_list.DemoList(),
            ),
            DemoButton(
              text: "带头部",
              builder: (context) => const header_list1.DemoList(),
            ),
            DemoButton(
              text: "固定头部",
              builder: (context) => const header_list2.DemoList(),
            ),
            DemoButton(
              text: "Overlap列表",
              builder: (context) => const header_list3.DemoList(),
            ),
            DemoButton(
              text: "滚动监听",
              builder: (context) => const header_list4.DemoList(),
            ),
            DemoButton(
              text: "重排列表1",
              builder: (context) => const reorder_list1.DemoList(),
            ),
            DemoButton(
              text: "重排列表2",
              builder: (context) => const reorder_list2.DemoList(),
            ),
            DemoButton(
              text: "瀑布流",
              builder: (context) => const staggered_list.DemoList(),
            ),
            DemoButton(
              text: "数据加载列表",
              builder: (context) => const loadable_list.DemoList(),
            ),
          ],
        ),
      ),
    );
  }
}
