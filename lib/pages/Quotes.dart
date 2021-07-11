import 'package:flutter/material.dart';
import 'package:gurukal_app/models/UserModel.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

import 'package:gurukal_app/models/QuoteModel.dart';

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  Future<QuoteModel> getQuotes(user_id) async {
    final String apiUrl =
        "https://crm.gurukal.in/api/customers/${user_id}/quotes";

    final response = await http.get(apiUrl);

    // check statuscode
    if (response.statusCode == 200) {
      final String responseString = response.body;

      return quoteModelFromJson(responseString);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // get user details
    final UserModel user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: FutureBuilder(
          future: getQuotes(user.user.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              if (snapshot.data.quote.length == 0) {
                return Container(child: Center(child: Text("Not found")));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.quote.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/invoice.png')),
                        title: Text(snapshot.data.quote[index].quotationNo),
                        subtitle: snapshot.data.quote[index].to != null
                            ? Text(snapshot.data.quote[index].to)
                            : Text("NO INFO"),
                        trailing:
                            snapshot.data.quote[index].status == 'declined'
                                ? Chip(
                                    padding: EdgeInsets.all(0),
                                    backgroundColor: Colors.redAccent,
                                    label: Text('DECLINED',
                                        style: TextStyle(color: Colors.white)),
                                  )
                                : Chip(
                                    padding: EdgeInsets.all(0),
                                    backgroundColor: Colors.greenAccent,
                                    label: Text('APPROVED',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                        onTap: () {
                          Navigator.pushNamed(context, '/quote_view',
                              arguments: {
                                "quote_id": snapshot.data.quote[index].id,
                              });
                        });
                  },
                );
              }
            }
          }),
    );
  }
}

class PlaceInfo {
  final String name;
  final Color startColor;
  final Color endColor;
  final String value;
  final String image;

  PlaceInfo(this.name, this.startColor, this.endColor, this.value, this.image);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;
  CustomCardShapePainter(this.radius, this.startColor, this.endColor);
  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;
    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = ui.Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
