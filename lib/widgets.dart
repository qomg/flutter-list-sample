import 'package:flutter/material.dart';

Widget newButton({
  required String text,
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  return MaterialButton(
    color: Colors.white,
    elevation: 0,
    hoverElevation: 0,
    focusElevation: 0,
    disabledElevation: 0,
    highlightElevation: 0,
    height: 50,
    child: Text(text),
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: builder));
    },
  );
}

/// height = 48
Widget newHeaderItem([String text = "姓名"]) {
  return ListTile(
    key: const Key("-1"),
    tileColor: Colors.amberAccent,
    dense: true,
    title: Text(text),
  );
}

Widget newListItem(int index, String firstName, String lastName) {
  return ListTile(
    key: Key("$index"),
    // dense: true,
    leading: Text("$index"),
    title: Text(firstName),
    subtitle: Text(lastName),
  );
}

Widget newListItem2(int index, String firstName, String lastName) {
  return SizedBox(
    height: 60,
    child: Row(
      children: [
        Text("$index"),
        Text(firstName),
        Text(lastName),
      ],
    ),
  );
}

Widget newDivider() {
  return const Divider(
    height: 0,
    thickness: 0.5, // 0.5dp
    indent: 15, // marginStart 15dp
    endIndent: 15, // marginEnd 15dp
  );
}

class MyPage extends StatelessWidget {
  const MyPage({
    Key? key,
    required this.title,
    required this.builder,
  }) : super(key: key);

  final String title;
  final WidgetBuilder builder;

  goBack(BuildContext context) {
    final navi = Navigator.of(context);
    if (navi.canPop()) {
      navi.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            goBack(context);
          },
          icon: const Icon(Icons.navigate_before),
        ),
        title: Text(title),
      ),
      body: SafeArea(child: Builder(builder: builder)),
    );
  }
}
