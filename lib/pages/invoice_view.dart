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

Future<SingleInvoiceModel> getInvoice(invoice_id) async {
  final String apiUrl = "https://crm.gurukal.in/api/shipments/${invoice_id}";

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

    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future: getInvoice(data['invoice_id']),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return SafeArea(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: ListView(children: <Widget>[
                    Column(
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/logo.png",
                                    scale: 2,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Date: ${DateFormat('dd-MM-yyyy').format(snapshot.data.data.date)}\nVehicle: ${snapshot.data.data.transportDriverVehicle}",
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
                        ),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.data.package.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                  leading: Text("${index + 1}"),
                                  title: Text(snapshot
                                      .data.data.package[index].description),
                                  subtitle: Text(
                                      "Serial No: ${snapshot.data.data.package[index].serialNo}\nDocket No: ${snapshot.data.data.docketNo}\nInvoice No: ${snapshot.data.data.package[index].invoiceNo}"),
                                  trailing: Text(
                                      "Quantity - ${snapshot.data.data.package[index].quantity}\nWeight - ${snapshot.data.data.package[index].weight}Kg")),
                            );
                          },
                        ),
                        Card(
                          child: Container(
                            width: double.infinity,
                            child: DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                  label: Text(
                                    'Charge Type',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Amount',
                                  ),
                                ),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Transportation')),
                                    DataCell(Text(
                                        '${snapshot.data.data.chargeTransportation}')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Handling')),
                                    DataCell(Text(
                                        '${snapshot.data.data.chargeHandling}')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('ODC Charge')),
                                    DataCell(Text(
                                        '${snapshot.data.data.chargeOdc}')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Halting')),
                                    DataCell(Text(
                                        '${snapshot.data.data.chargeHalting}')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Insurance')),
                                    DataCell(Text(
                                        '${snapshot.data.data.chargeInsurance}')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('GST')),
                                    DataCell(Text(
                                        '${snapshot.data.data.chargeTaxAmount}')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Total')),
                                    DataCell(Text(
                                        '${snapshot.data.data.chargeTotal}')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Advance Paid')),
                                    DataCell(Text(
                                        '${snapshot.data.data.chargeAdvancePaid}')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Balance Amount')),
                                    DataCell(Text(
                                        '${snapshot.data.data.chargeBalance}')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              );
            }
          }),
    ));
  }
}
