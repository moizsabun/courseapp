import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseapp/CustomWidgets/custom_circlularButton.dart';
import 'package:courseapp/CustomWidgets/custom_scaffold.dart';
import 'package:courseapp/Join/join_layout.dart';
import 'package:courseapp/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavHome extends StatelessWidget {
  List<Map> datafromFirestore = [];
  List<Widget> listItems = List();
  @override
  Widget build(BuildContext context) {
    List<Widget> x = List();
    // items.forEach((i) {
    //   x.add(
    //     Container(
    //       height: 50,
    //       width: 30,
    //       child: Card(
    //         child: Text(i),
    //         color: Colors.lightBlue,
    //       ),
    //     ),
    //   );
    // });

//Calling Firease here

    return SafeArea(
      child: CustomScafflod(
          title: 'favorites Page',
          index: 1,
          body: ListView(
            children: <Widget>[
              // Column(
              //   children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Favorite Items',
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream:
                      Firestore.instance.collection('favorites').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return LinearProgressIndicator();
                    } else {
                      return _buildList(context, snapshot.data.documents, x);
                    }
                  }),
              //   ],
              // ),
            ],
          )
          // GridView.count(
          //     padding: const EdgeInsets.all(8),
          //     crossAxisSpacing: 8,
          //     childAspectRatio: 1.5,
          //     mainAxisSpacing: 8,
          //     crossAxisCount: listItems.length,
          //     children: listItems),

          ),
    );
  }

  Widget _buildList(
      BuildContext context, List<DocumentSnapshot> document, List<Widget> x) {
    document.forEach((f) {
      x.add(InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/' + f['image'],
                    height: MediaQuery.of(context).size.height / 3.6,
                    width: MediaQuery.of(context).size.width / 2.2,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    height: 30,
                    width: 30,
                    bottom: 8,
                    right: 8,
                    child: CustomCircularButton(
                      icon: Icon(
                        Icons.favorite,
                        color: primaryColor,
                        size: 15,
                      ),
                      onpressed: () {},
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 2),
              child: Text(
                f['name'],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
            Row(
              children: <Widget>[
                FlutterRatingBarIndicator(
                  itemPadding: const EdgeInsets.only(top: 2, bottom: 2),
                  rating: double.parse(f['rating'].toString()),
                  itemCount: 5,
                  itemSize: 10.0,
                  emptyColor: Colors.amber.withAlpha(50),
                ),
                Text(
                  f['rating'].toString() +
                      ' (' +
                      f['review'].toString() +
                      ' Reviews)',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ],
            )
          ],
        ),
      ));
    });
    // return ListTile(
    //   title: Text(document[0]['rating'].toString()),
    //   subtitle: Text(document[0]['review'].toString()),
    // );

    return GridView.count(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 8,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.25),
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        children: x);
  }
}

// class Record {
//   final String imageURL;
//   final int ratings;
//   final int reviewCount;
//   final DocumentReference reference;

//   Record.fromMap(Map<String, dynamic> map, {this.reference})r
//       : assert(map['name'] != null),
//         assert(map['votes'] != null),
//         imageURL = map['ImageURL'],
//         ratings = map['ratings'],
//         reviewCount = map['reviewCount'];

//   Record.fromSnapshot(DocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data, reference: snapshot.reference);

//   @override
//   String toString() => "Record<$imageURL:$ratings:$reviewCount>";
// }
