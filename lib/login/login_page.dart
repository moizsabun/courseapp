import 'package:flutter/material.dart';
import 'package:courseapp/home/home_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  text: 'Login',
                ),
                Tab(
                  text: 'Register',
                )
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Login Here'),
                  RaisedButton(
                    child: new Text('Login'),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  )
                ],
              ),
              Text('Register Here'),
            ],
          ),
        );
        
       
  }
}
