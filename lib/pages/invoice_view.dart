import 'package:flutter/material.dart';
import 'package:gurukal_app/models/SingleInvoiceModel.dart';
import 'package:gurukal_app/pages/widgets/customer_card.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

// import 'package:navigation/pages/common_widget.dart';
class InvoiceView extends StatefulWidget {
  @override
  _InvoiceViewState createState() => _InvoiceViewState();
}

Future<SingleInvoiceModel> getInvoice() async {
  final String apiUrl = "https://crm.gurukal.in/api/shipments/200";

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
  Widget build(BuildContext context) {
    // Read value

    // receive user data from login
    Map data = ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future: getInvoice(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return SafeArea(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Column(
                    children: [
                      Text(
                        "FREIGHT INVOICE",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                      Card(
                          color: Colors.blueAccent[400],
                          shadowColor: Colors.black,
                          elevation: 10,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              children: [
                                Text(
                                  "INVOICE NO: ${snapshot.data.data.freightInvoiceNumber}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Card(
                          shadowColor: Colors.black,
                          elevation: 5,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Date: ${DateFormat('dd-MM-yyyy').format(snapshot.data.data.date)}",
                                      style: TextStyle(
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    Text(
                                      "Vehicle: ${snapshot.data.data.transportDriverVehicle}",
                                      style: TextStyle(
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Card(
                          shadowColor: Colors.black,
                          elevation: 5,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Transaction Type: ${snapshot.data.data.packageTransactionType}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      snapshot.data.data.billTo == "consignor"
                          ? CustomerCard(
                              name: snapshot.data.data.sender.name,
                              address: snapshot.data.data.sender.address,
                              gst: snapshot.data.data.sender.gst,
                              title: "BILL TO",
                            )
                          : CustomerCard(
                              name: snapshot.data.data.receiver.name,
                              address: snapshot.data.data.receiver.address,
                              gst: snapshot.data.data.receiver.gst,
                              title: "BILL TO",
                            ),
                      CustomerCard(
                        name: snapshot.data.data.sender.name,
                        address: snapshot.data.data.sender.address,
                        gst: snapshot.data.data.sender.gst,
                        title: "Sender",
                      ),
                      CustomerCard(
                        name: snapshot.data.data.receiver.name,
                        address: snapshot.data.data.receiver.address,
                        gst: snapshot.data.data.receiver.gst,
                        title: "Receiver",
                      )
                    ],
                  ),
                ),
              );
            }
          }),
    ));
  }
}
