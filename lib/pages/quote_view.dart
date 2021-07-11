import 'package:flutter/material.dart';
import 'package:gurukal_app/models/SingleQuoteModel.dart';
import 'package:gurukal_app/pages/widgets/customer_card.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

// import 'package:navigation/pages/common_widget.dart';
class QuoteView extends StatefulWidget {
  @override
  _QuoteViewState createState() => _QuoteViewState();
}

Future<SingleQuoteModel> getQuote(quote_id) async {
  final String apiUrl = "https://crm.gurukal.in/api/quotations/${quote_id}";

  final response = await http.get(apiUrl);

  // check statuscode
  if (response.statusCode == 200) {
    final String responseString = response.body;

    return singleQuoteModelFromJson(responseString);
  } else {
    return null;
  }
}

class _QuoteViewState extends State<QuoteView> {
  @override
  Widget build(BuildContext context) {
    // Read value

    // receive user data from login
    Map data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future: getQuote(data['quote_id']),
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
                          "QUOTATION",
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
                                    "REF NO: ${snapshot.data.quotationNo}",
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
                                        "Date: ${DateFormat('dd-MM-yyyy').format(snapshot.data.createdAt)}",
                                        style: TextStyle(
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      snapshot.data.status == 'declined'
                                          ? Chip(
                                              padding: EdgeInsets.all(0),
                                              backgroundColor: Colors.redAccent,
                                              label: Text('DECLINED',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            )
                                          : Chip(
                                              padding: EdgeInsets.all(0),
                                              backgroundColor:
                                                  Colors.greenAccent,
                                              label: Text('APPROVED',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        CustomerCard(
                          name: snapshot.data.customer.name,
                          address: snapshot.data.customer.address,
                          gst: snapshot.data.customer.gst,
                          title: "TO",
                        ),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.list.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                  leading: Text("${index + 1}"),
                                  title: Text(
                                      snapshot.data.list[index].description),
                                  subtitle: Text(
                                      "To: ${snapshot.data.list[index].to}"),
                                  trailing: Text(
                                      "Size(feet) - ${snapshot.data.list[index].size}\nWeight- ${snapshot.data.list[index].weight}")),
                            );
                          },
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Terms & Conditions",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "1. Rates quoted above are valid for 48Hrs only."),
                              Text(
                                  "2. Extra charges will be implied If the consignment exceeds the limit of fleet dimension/ RTO Regulations."),
                              Text(
                                  "3. Advance payment is to be made (unless stated above, in which case you shall pay the quoted price)."),
                              Text(
                                  "4. If the unloading time exceeds 4hrs halting will be charged as per actuals"),
                              Text(
                                  "5. Payments are to be made within 7 days from the date of invoice."),
                              Text(
                                  "6. If Vehicle Is Cancelled Prior To 60min/On Arrival Charges Are Applicable."),
                              Text(
                                  "7. Change in destination/location is to be charged extra."),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Bank Details",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "Name : Axis Bank\n8th Mile Branch\nA/c No.: 918020030455515\nIFSC: UTIB0002926")
                            ],
                          ),
                        )
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
