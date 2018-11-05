import 'package:flutter_demo/screens/settings.dart';
import 'package:flutter_demo/screens/clients/client_screen.dart';

import 'package:flutter/material.dart';

class MyTabs extends StatefulWidget {
  static final String routeName = 'my-tabs';

  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pages"), 
        backgroundColor: Colors.deepOrange,
        bottom: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.arrow_forward)),
            new Tab(icon: new Icon(Icons.arrow_downward)),
            new Tab(icon: new Icon(Icons.arrow_back)),
          ]
        )
      ),
      bottomNavigationBar: new Material(
        color: Colors.deepOrange,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.arrow_forward)),
            new Tab(icon: new Icon(Icons.arrow_downward)),
            new Tab(icon: new Icon(Icons.arrow_back)),
          ]
        )
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          Container(
            child: new Center(
              child: new Icon(Icons.accessibility_new, size: 150.0, color: Colors.brown)
            )
          ),
          ClientScreen(),
          Settings()
          /*new first.First(),
          new second.Second(),
          new third.Third()*/
        ]
      )
    );
  }
}
