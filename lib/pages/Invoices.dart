import 'package:flutter/material.dart';

import 'package:gurukal_app/models/InvoiceModel.dart';
import 'package:gurukal_app/models/UserModel.dart';
import 'package:http/http.dart' as http;

// import 'package:navigation/pages/common_widget.dart';
class InvoicePage extends StatefulWidget {
  @override
  _InvoicePageState createState() => _InvoicePageState();
}

Future<InvoiceModel> getInvoices(user_id) async {
  final String apiUrl =
      "https://crm.gurukal.in/api/customers/${user_id}/invoices";
  // final String apiUrl = "https://crm.gurukal.in/api/customers/4/invoices";

  final response = await http.get(apiUrl);

  // check statuscode
  if (response.statusCode == 200) {
    final String responseString = response.body;

    return invoiceModelFromJson(responseString);
  } else {
    return null;
  }
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    // Read value

    // receive user data from login
    final UserModel user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future: getInvoices(user.user.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              if (snapshot.data.data.shipment.length == 0) {
                return Container(child: Center(child: Text("Not found")));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.data.shipment.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/invoice.png')),
                        title: Text(snapshot
                            .data.data.shipment[index].freightInvoiceNumber),
                        subtitle: snapshot.data.data.shipment[index]
                                    .deliveryAddress !=
                                null
                            ? Text(snapshot
                                .data.data.shipment[index].deliveryAddress)
                            : Text("NO INFO"),
                        trailing: double.parse(snapshot
                                    .data.data.shipment[index].chargeBalance) >
                                0
                            ? Chip(
                                padding: EdgeInsets.all(0),
                                backgroundColor: Colors.redAccent,
                                label: Text('UNPAID',
                                    style: TextStyle(color: Colors.white)),
                              )
                            : Chip(
                                padding: EdgeInsets.all(0),
                                backgroundColor: Colors.greenAccent,
                                label: Text('PAID',
                                    style: TextStyle(color: Colors.white)),
                              ),
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     new MaterialPageRoute(
                          //         builder: (context) => InvoicePage()));
                          Navigator.pushNamed(context, '/invoice_view',
                              arguments: {
                                "invoice_id":
                                    snapshot.data.data.shipment[index].id,
                              });
                        });
                  },
                );
              }
            }
          }),
    ));
  }
}
