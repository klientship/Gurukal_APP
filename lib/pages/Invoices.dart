import 'package:flutter/material.dart';
import 'package:gurukal_app/common/contants.dart';

import 'package:gurukal_app/widgets/counter.dart';

// import 'package:navigation/pages/common_widget.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
      ),
    ));
  }
}
