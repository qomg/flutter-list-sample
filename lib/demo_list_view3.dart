import 'package:flutter/material.dart';

import 'widgets.dart';
import 'words.dart';

class DemoList extends StatelessWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "简单列表3",
      builder: (context) => WordList(
        builder: (context, data) => ListView.separated(
          itemBuilder: (context, index) => getListItem(data, index),
          itemCount: getItemCount(data),
          separatorBuilder: (context, index) => newDivider(),
        ),
      ),
    );
  }
}
