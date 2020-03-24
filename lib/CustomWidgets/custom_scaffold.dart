import 'package:courseapp/CustomWidgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class CustomScafflod extends StatelessWidget {
  const CustomScafflod(
      {@required this.title,
      @required this.body,
      @required this.index,
      Key key})
      : super(key: key);

  final String title;
  final Widget body;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.search),
        elevation: 2,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomAppbar(
        index: index,
      ),
    );
  }
}
