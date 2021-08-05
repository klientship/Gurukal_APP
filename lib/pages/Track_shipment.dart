import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:gurukal_app/models/TrackShipmentModel.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TrackPage extends StatefulWidget {
  @override
  _TrackPageState createState() => _TrackPageState();
}

final TextEditingController docketNoController = TextEditingController();
double iconSize = 40;
bool isFetched = false;

class _TrackPageState extends State<TrackPage> {
  TrackShipmentModel shipmentDetails;
  Future<TrackShipmentModel> trackShipment(String docket_no) async {
    final String apiUrl =
        'https://crm.gurukal.in/api/shipments/${docket_no}/shipment_track';

    final response = await http.get(apiUrl);

    // check statuscode
    if (response.statusCode == 200) {
      final String responseString = response.body;
      isFetched = true;
      return trackShipmentModelFromJson(responseString);
    } else {
      isFetched = false;
      return null;
    }
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget getStatus(status) {
      switch (status) {
        case 'Awaiting pickup':
          return Chip(
            padding: EdgeInsets.all(0),
            backgroundColor: Colors.grey,
            label:
                Text('Awaiting pickup', style: TextStyle(color: Colors.white)),
          );
          break;

        case 'Delivered':
          return Chip(
            padding: EdgeInsets.all(0),
            backgroundColor: Colors.green,
            label: Text('Delivered', style: TextStyle(color: Colors.white)),
          );
          break;
        default:
          return Chip(
            padding: EdgeInsets.all(0),
            backgroundColor: Colors.blue,
            label: Text('Intransit', style: TextStyle(color: Colors.white)),
          );
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                        child: Center(
                          child: Text(
                            "Track Shipment",
                            style: new TextStyle(
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: docketNoController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Docket no',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter docket no';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if (_formKey.currentState.validate()) {
                              // Process data.
                              final String docketNo = docketNoController.text;
                              var data = await trackShipment(docketNo);
                              setState(() {
                                shipmentDetails = data;
                              });
                            }
                          },
                          child: Text('Track'),
                        ),
                      ),
                    ],
                  ),
                ),
                isFetched && shipmentDetails != null
                    ? ListView.builder(
                        itemCount: shipmentDetails.track.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: shipmentDetails.track[index].location == null
                                ? Text("NO INFO")
                                : Text(
                                    "${shipmentDetails.track[index].location}"),
                            subtitle: Text(DateFormat('dd-MM-yyyy – kk:mm')
                                .format(
                                    shipmentDetails.track[index].createdAt)),
                            trailing:
                                getStatus(shipmentDetails.track[index].status),
                          );
                        },
                      )
                    : Container()
              ],
            )),
      ),
    );
  }
}
