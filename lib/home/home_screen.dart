import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseapp/CustomWidgets/custom_circlularButton.dart';
import 'package:courseapp/CustomWidgets/custom_scaffold.dart';
import 'package:courseapp/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../favourite/favourite_layout.dart';

class HomePage extends StatelessWidget {
  List<Widget> xlist = List();
  List<Widget> x = List();
  FavHome getStreamBuilder = new FavHome();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScafflod(
          title: 'My Home Page',
          index: 0,
          body: ListView(
            children: <Widget>[
              // Column(
              //   children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Dishes',
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'View More',
                            style: TextStyle(color: Colors.red),
                          ))),
                ],
              ),

              //  Padding(
              //    padding: const EdgeInsets.only(left:8.0 , right: 8.0),
              //    child:
              buildStreamBuilderforCarousel(context, x, Icons.favorite_border),
              //  ),

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 65.0,
                  child: ListView(
                    shrinkWrap: true,
                    // primary: false,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Cardhome(
                        title: 'Drinks',
                        reviews: '5 Items',
                        icon: FontAwesomeIcons.wineBottle,
                      ),
                      Cardhome(
                        title: 'Miscellaneous',
                        reviews: '20 Items',
                        icon: FontAwesomeIcons.cannabis,
                      ),
                      Cardhome(
                        title: 'Desert',
                        reviews: '9 Items',
                        icon: FontAwesomeIcons.birthdayCake,
                      ),
                      Cardhome(
                        title: 'Fast Food',
                        reviews: '5 Items',
                        icon: FontAwesomeIcons.pizzaSlice,
                      ),
                      Cardhome(
                        title: 'Meals',
                        reviews: '15 Items',
                        icon: FontAwesomeIcons.breadSlice,
                      ),
                      Cardhome(
                        title: 'Desi',
                        reviews: '10 Items',
                        icon: FontAwesomeIcons.burn,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Popular Items',
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              ),
              getStreamBuilder.buildStreamBuilder(
                  context, x, Icons.favorite_border),
              //   ],
              // ),
            ],
          )),
    );
  }

  StreamBuilder<QuerySnapshot> buildStreamBuilderforCarousel(
      BuildContext context, List<Widget> x, IconData icon) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('favorites').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          } else {
            return _buildCarouselSlider(
                context, snapshot.data.documents, x, icon);
          }
        });
  }

  Widget _buildCarouselSlider(BuildContext context,
      List<DocumentSnapshot> document, List<Widget> x, IconData icon) {
    document.forEach((f) {
      xlist.add(InkWell(
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
                    //  height: MediaQuery.of(context).size.height / 2.4,
                    // width: MediaQuery.of(context).size.width / 2.4,
                    // fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    height: 30,
                    width: 30,
                    bottom: 8,
                    right: 8,
                    child: CustomCircularButton(
                      icon: Icon(
                        icon,
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

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: CarouselSlider(
        height: MediaQuery.of(context).size.height / 2.4,
        items: xlist.toList(),
        autoPlay: true,
        viewportFraction: 1.0,
      ),
    );
  }
}

class Cardhome extends StatelessWidget {
  const Cardhome({
    @required this.title,
    @required this.reviews,
    @required this.icon,
    Key key,
  }) : super(key: key);

  final String title;
  final String reviews;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 65.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 4.0,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 0.0, right: 10.0),
                  child: Icon(
                    icon,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      reviews,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
