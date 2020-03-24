

import 'package:flutter/material.dart';
import 'package:courseapp/favourite/favourite_layout.dart';

class Join extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController( 
        length: 2,
        child: Scaffold( 
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Color(0xFFffffff),
            bottom: TabBar(
                // labelStyle: TextStyle(
                //   backgroundColor: Color(0xFF000000),
                // ),
                tabs: [
                  Tab(
                    text: 'Login',
                    
                  ),
                  Tab(
                    text: 'Register',
                    
                  ),
                  
                ],
                indicatorColor: Colors.red, 
                labelColor: Colors.red,
                unselectedLabelColor: Colors.grey,
                ),
          ),
          body: TabBarView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Log in to your account",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  CardUI(
                   obsecureText: false, hintText: 'User Name',
                  ),
                  CardUI(
                 obsecureText: true,   hintText: 'Password',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 32.0, top: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16,top:24,bottom: 8 ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          
                          child: RaisedButton(
                            elevation: 2,
                            
                            child: new Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => FavHome()) );
                                  
                            },
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Divider(
                      //thickness: 1.0,
                      color: Colors.red,
                      height: 0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                   
                    children: <Widget>[ 
                      new CircularButtton(iconS:Image.asset('assets/images/fb_logo.png' , color: Colors.white,)  , bgColor: Colors.blue[800],onpressed: (){},), 
                      new CircularButtton(iconS:Image.asset('assets/images/google_logo.png',color: Colors.blue[800],) ,bgColor: Colors.white,onpressed: (){},)   
                      // RaisedButton(
                      //   onPressed: null,
                      //   child: Text('Facebook'),
                      // ),
                      // RaisedButton(
                      //   onPressed: null,
                      //   child: Text('Gmail'),
                      // ),
                    ],
                  ),
                ], 
              ),
              Text('Register Here'), 
            ],
          ),
        ),
      ),
    );
  }
}

class CircularButtton extends StatelessWidget {
  const CircularButtton({
    Key key,
  @required this.iconS,
  @required this.bgColor,
  @required this.onpressed
  }) : super(key: key);

final Image iconS;
final void Function() onpressed; 
final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onpressed,
    shape: new CircleBorder(),
    fillColor: bgColor,
    elevation: 8,
    padding: EdgeInsets.all(4),
    child: CircleAvatar(
      
        child :iconS,
        backgroundColor: Colors.transparent,
       
    ),
    );
  }
}

class CardUI extends StatelessWidget {
  const CardUI({
    Key key,
    @required this.hintText,
    @required this.obsecureText,
  }) : super(key: key);

  final String hintText;
  final bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Card(
        elevation: 3.0,
        child: TextField(
          obscureText: obsecureText,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black, 
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
            prefixIcon: Icon(Icons.account_circle),
          ),
        ),
      ),
    );
  }
}
