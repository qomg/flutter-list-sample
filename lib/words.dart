import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'widgets.dart';

typedef WordListBuilder = Widget Function(
  BuildContext context,
  List<WordPair>? data,
);

int getItemCount(List<WordPair>? data) {
  return data == null || data.isEmpty ? 0 : (data.length * 2 - 1);
}

int getItemCount0(List<WordPair>? data) {
  return data?.length ?? 0;
}

Widget getListItem(List<WordPair>? data, int index, [int style = 0]) {
  if (index.isOdd) {
    return const MyDivider();
  } else {
    final position = index ~/ 2;
    final item = data![position];
    return style == 0
        ? Username(index: position, firstName: item.first, lastName: item.second)
        : Username1(index: position, firstName: item.first, lastName: item.second);
  }
}

class WordList extends StatelessWidget {
  const WordList({Key? key, required this.builder}) : super(key: key);

  final WordListBuilder builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WordPair>>(
      future: generateWords(),
      builder: (context, snapshot) => builder(context, snapshot.data),
    );
  }
}

Future<List<WordPair>> generateWords({int delay = 10, int count = 50}) async {
  return Future.delayed(
    Duration(milliseconds: delay),
    () => generateWordPairs().take(count).toList(),
  );
}
