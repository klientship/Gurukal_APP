import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:gurukal_app/models/TrackShipmentModel.dart';
import 'package:gurukal_app/pages/Quotes.dart';
import 'package:gurukal_app/pages/dashboard.dart';
import 'package:gurukal_app/pages/invoice_view.dart';
import 'package:gurukal_app/pages/login.dart';
import 'package:gurukal_app/pages/quote_view.dart';
import 'pages/track_shipment.dart';
import 'pages/Invoices.dart';
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
        '/invoice_view': (context) => InvoiceView(),
        '/quote_view': (context) => QuoteView(),
        '/invoices': (context) => InvoicePage(),
        '/track': (context) => TrackPage(),
      },
      // home: MyBottomNavigationBar()
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();

  final List<Widget> _children = [
    DashboardPage(),
    InvoicePage(),
    QuotePage(),
    // TrackPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[currentPage],
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Dashboard"),
            TabData(iconData: Icons.request_quote_outlined, title: "Invoices"),
            TabData(iconData: Icons.analytics, title: "Quotes"),
            // TabData(iconData: Icons.local_shipping, title: "Track"),
            TabData(iconData: Icons.account_circle, title: "User")
          ],
          initialSelection: 0,
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ));
  }
}
