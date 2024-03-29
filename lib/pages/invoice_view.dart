import 'package:flutter/material.dart';
import 'package:gurukal_app/models/SingleInvoiceModel.dart';
import 'package:gurukal_app/pages/widgets/customer_card.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

// import 'package:navigation/pages/common_widget.dart';
class InvoiceView extends StatefulWidget {
  @override
  _InvoiceViewState createState() => _InvoiceViewState();
}

Future<SingleInvoiceModel> getInvoice() async {
  final String apiUrl = "https://crm.gurukal.in/api/shipments/400";

  final response = await http.get(apiUrl);

  // check statuscode
  if (response.statusCode == 200) {
    final String responseString = response.body;

    return singleInvoiceModelFromJson(responseString);
  } else {
    return null;
  }
}

class _InvoiceViewState extends State<InvoiceView> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Read value

    // receive user data from login
    Map data = ModalRoute.of(context).settings.arguments;
    WebViewController _controller;
    return Scaffold(
        appBar: AppBar(
          // title: Text('Freight Invoice'),
          backgroundColor: Colors.blueAccent[400],
        ), //AppBar
        body: WebView(
          key: UniqueKey(),
          zoomEnabled: false,
          userAgent:
              "Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Mobile Safari/537.36",
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl:
              "https://crm.gurukal.in/invoices/mobile/${data['invoice_id']}",
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
        ) // center
        ); //Scaffold
  }
}
