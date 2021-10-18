import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'widgets.dart';
import 'words.dart';

class DemoList extends StatelessWidget {
  const DemoList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MyPage(
      title: "瀑布流",
      builder: (context) => WordList(
        builder: (context, data) => StaggeredGridView.countBuilder(
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          crossAxisCount: 2,
          itemCount: data?.length ?? 0,
          itemBuilder: (context, index) {
            return Container(
              width: 40,
              height: Random().nextInt(10) * 30.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: Center(child: Text(data![index].asString)),
            );
          },
          staggeredTileBuilder: (index) {
            return const StaggeredTile.fit(1);
          },
        ),
      ),
    );
  }
}
