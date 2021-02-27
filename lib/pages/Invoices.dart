import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:gurukal_app/common/contants.dart';
import 'package:gurukal_app/models/InvoiceModel.dart';
import 'package:http/http.dart' as http;

// import 'package:navigation/pages/common_widget.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Future<InvoiceModel> getInvoices() async {
  final String apiUrl = "https://crm.gurukal.in/api/customers/3/invoices";

  final response = await http.get(apiUrl);

  // check statuscode
  if (response.statusCode == 200) {
    final String responseString = response.body;

    return invoiceModelFromJson(responseString);
  } else {
    return null;
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future: getInvoices(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.data.shipment.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://png.pngtree.com/png-vector/20191011/ourmid/pngtree-invoice-icon-png-image_1817550.jpg"),
                      ),
                      title: Text(snapshot
                          .data.data.shipment[index].freightInvoiceNumber),
                      subtitle:
                          Text(snapshot.data.data.shipment[index].docketNo),
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
                        //         builder: (context) =>
                        //             DetailPage(snapshot.data[index])));
                      });
                },
              );
            }
          }),
    ));
  }
}
