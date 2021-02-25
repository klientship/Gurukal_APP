import 'package:flutter/material.dart';
import 'package:gurukal_app/common/contants.dart';
import 'dart:ui' as ui;

import 'package:gurukal_app/widgets/counter.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:navigation/pages/common_widget.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _borderRadius = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 30,
                    color: kShadowColor,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Counter(
                    color: kInfectedColor,
                    number: 1046,
                    title: "OUTSTANDING",
                  ),
                  Counter(
                    color: kDeathColor,
                    number: 87,
                    title: "PAID",
                  ),
                  Counter(
                    color: kRecovercolor,
                    number: 46,
                    title: "TOTAL",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
