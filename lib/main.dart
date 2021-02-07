import 'package:flutter/material.dart';
import 'package:gurukal_app/pages/login.dart';
import 'pages/Track_shipment.dart';
import 'pages/Invoices.dart';
import 'pages/Quotes.dart';
import 'pages/UserInfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/dashboard': (context) => MyBottomNavigationBar(),
      },
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
  void onTappedBar(int index) {
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
            icon: Icon(Icons.request_quote_outlined),
            title: Text("Invoices"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            title: Text("Quotes"),
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
