import 'package:flutter/material.dart';

class DemoButton extends StatelessWidget {
  const DemoButton({
    Key? key,
    required this.text,
    required this.builder,
  }) : super(key: key);

  final String text;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
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
}

class ItemHeader extends StatelessWidget {
  const ItemHeader({Key? key, this.text = "姓名"}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    /// height = 48
    return ListTile(
      key: const Key("-1"),
      tileColor: Colors.amberAccent,
      dense: true,
      title: Text(text),
    );
  }
}

class Username extends StatelessWidget {
  const Username({
    Key? key,
    required this.index,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  final int index;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key("$index"),
      // dense: true,
      leading: Text("$index"),
      title: Text(firstName),
      subtitle: Text(lastName),
    );
  }
}

class Username1 extends StatelessWidget {
  const Username1({
    Key? key,
    required this.index,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  final int index;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 20,
            children: [
              Text("$index"),
              Wrap(
                direction: Axis.vertical,
                runSpacing: 8,
                children: [
                  Text(firstName),
                  Text(lastName),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Username2 extends StatelessWidget {
  const Username2({
    Key? key,
    required this.index,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  final int index;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyDivider(color: Colors.transparent),
              Wrap(
                direction: Axis.horizontal,
                spacing: 20,
                children: [
                  Text("$index"),
                  Wrap(
                    direction: Axis.vertical,
                    runSpacing: 8,
                    children: [
                      Text(firstName),
                      Text(lastName),
                    ],
                  ),
                ],
              ),
              const MyDivider()
            ],
          ),
        ),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: 0,
      thickness: 0.5, // 0.5dp
      indent: 15, // marginStart 15dp
      endIndent: 15, // marginEnd 15dp
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({
    Key? key,
    required this.title,
    required this.builder,
    this.floatingActionButtonBuilder,
  }) : super(key: key);

  final String title;
  final WidgetBuilder builder;
  final WidgetBuilder? floatingActionButtonBuilder;

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
      floatingActionButton: floatingActionButtonBuilder?.call(context),
    );
  }
}
