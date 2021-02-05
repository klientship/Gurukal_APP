import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {

  final double _borderRadius = 24;

  var items = [
    PlaceInfo('SENT QUOTES', Color(0xff6DC8F3), Color(0xff73A1F9),'₹ 0',
        'assets/quotation.png'),
    PlaceInfo('APPROVED', Color(0xffD76EF5), Color(0xff8F7AFE), '₹ 0',
        'assets/Approved.png'),
    PlaceInfo('REJECTED', Color(0xffFF5B95), Color(0xffF85560), '0',
        'assets/rejected.png'),
    // PlaceInfo('TOTAL QUOTATIONS', Color(0xffD76EF5), Color(0xff8F7AFE), '24',
    //     'assets/quotation.png'),
    // PlaceInfo('TOTAL CUSTOMERS', Color(0xff42E695), Color(0xff3BB2BB), '173',
    //     'assets/customer.png'),
    // PlaceInfo('PENDING PAYMENT', Color(0xff6DC8F3), Color(0xff73A1F9), '1425734',
    //     'assets/payment.png'),
    // PlaceInfo('UPCOMING EXPENSES', Color(0xffFF5B95), Color(0xffF85560), '77000',
    //     'assets/expenses.png'),
    // PlaceInfo('PAID INVOICES', Color(0xffFFB157), Color(0xffFFA057), '₹ 0',
    //     'assets/download.png'),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("GURUKAL LOGISTICS"),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget> [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      gradient: LinearGradient(
                        colors: [  items[index].startColor,  items[index].endColor ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:  items[index].endColor,
                          blurRadius: 12,
                          offset: Offset(0,6),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    top: 0 ,
                    child: CustomPaint(
                      size: Size(100,150),
                      painter: CustomCardShapePainter(_borderRadius, items[index].startColor,  items[index].endColor),
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      children: <Widget> [
                        Expanded(
                          child: Image.asset(items[index].image,
                            height:64,
                            width: 64,
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              SizedBox(height: 16),
                              Text(
                                items[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                items[index].value,
                                style: TextStyle(color: Colors.white,
                                    fontFamily: 'Avenir',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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

class CustomCardShapePainter extends CustomPainter{
  final double radius;
  final Color startColor;
  final Color endColor;
  CustomCardShapePainter(this.radius,this.startColor,this.endColor);
  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;
    var paint = Paint();
    paint.shader = ui. Gradient.linear(
        Offset(0, 0),
        Offset(size.width, size.height),[
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = ui.Path()
      ..moveTo(0,size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0 , size.height)
      ..close();
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(   CustomPainter oldDelegate) {
    return true;
  }

}