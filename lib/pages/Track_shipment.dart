import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
class TrackPage extends StatefulWidget {
  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  String _SenderInfo;

  double iconSize = 40;


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildCustomerEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tracking Number',

          border:OutlineInputBorder()),
      // maxLength: 10,
      // maxLines: 3,
      validator: (String value){
        if (value.isEmpty){
          return 'Required';
        }
        return null;
      },
      onSaved: (String value){
        _SenderInfo = value;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    track();
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Shipment"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text("Tracking Number",style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  _buildCustomerEmail(),
                  SizedBox(height: 16),
                  Container(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          child: Text('Track',
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                          onPressed: () {
                            if(!_formkey.currentState.validate())
                            {
                              return;
                            }
                            _formkey.currentState.save();
                            print(_SenderInfo);

                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: Table(
                          border: TableBorder.all(),
                          // columnWidths: {
                          //   1: FlexColumnWidth(1.5),
                          //   2: FlexColumnWidth(.3),
                          // },
                          children: [
                            TableRow( children: [
                              Column(children:[
                                Text('Date',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 18),
                                ),
                              ]),
                              Column(children:[
                                Text('Status', style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                              ]),
                              Column(children:[
                                Text('Location', style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                              ]),
                            ]),
                            TableRow( children: [
                              Column(children:[
                                Center(child:
                                Text(' '),
                                ),
                              ]),
                              Column(children:[
                                Text(' '),
                              ]),
                              Column(children:[
                                Text(' '),
                              ]),
                            ]),
                          ],
                        ),
                      ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}

void track() async{
  var response1 = await Dio().get('https://crm.gurukal.in/api/customers/1');
  print(response1.data);
}
