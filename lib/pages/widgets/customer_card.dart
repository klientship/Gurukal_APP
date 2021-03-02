import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({this.name, this.address, this.gst, this.title});

  final String title;
  final String name;
  final String address;
  final String gst;

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.black,
        elevation: 5,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "${name} \n${address} \nGST: ${gst}",
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
