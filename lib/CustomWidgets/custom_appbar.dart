import 'package:courseapp/favourite/favourite_layout.dart';
import 'package:courseapp/home/home_screen.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({@required this.index, Key key}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                if (index != 0)
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
              },
              color: index == 0 ? Colors.red : Theme.of(context).textTheme.caption.color,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  if (index != 1)
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FavHome()));
                },
                color: index == 1 ? Colors.red : Theme.of(context).textTheme.caption.color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
                color: index == 2 ? Colors.red : Theme.of(context).textTheme.caption.color,
              ),
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
              color: index == 3 ? Colors.red : Theme.of(context).textTheme.caption.color,
            )
          ],
        ),
      ),
    );
  }
}
