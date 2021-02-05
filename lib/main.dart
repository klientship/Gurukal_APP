import 'package:flutter/material.dart';
import 'pages/Track_shipment.dart';
import 'pages/Invoices.dart';
import 'pages/Quotes.dart';
import 'pages/UserInfo.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp
      (
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    QuotePage(),
    TrackPage(),
    UserPage(),
  ];
  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.orangeAccent,
        items: [
          BottomNavigationBarItem(

            icon: Icon(Icons.request_quote_outlined), title: Text("Invoices"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics), title: Text("Quotes"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping), title: Text("Track Shipment")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("User")),
        ],
      ),
    );
  }
}
