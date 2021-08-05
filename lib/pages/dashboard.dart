import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gurukal_app/models/UserModel.dart';
import 'package:gurukal_app/models/dashboard_model.dart';
import 'package:gurukal_app/pages/Invoices.dart';
import 'package:http/http.dart' as http;

// import 'shop_items_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

Future<DashboardModel> getDetails(user_id) async {
  final String apiUrl =
      "https://crm.gurukal.in/api/customers/${user_id}/details";

  final response = await http.get(apiUrl);

  // check statuscode
  if (response.statusCode == 200) {
    final String responseString = response.body;

    return dashboardModelFromJson(responseString);
  } else {
    return null;
  }
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final UserModel user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Dashboard',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0)),
          actions: <Widget>[],
        ),
        body: FutureBuilder(
            future: getDetails(user.user.id),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(child: Center(child: Text("Loading...")));
              } else {
                return StaggeredGridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  children: <Widget>[
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Total shipments',
                                      style:
                                          TextStyle(color: Colors.blueAccent)),
                                  Text("${snapshot.data.totalShipments}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 34.0))
                                ],
                              ),
                              Material(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(Icons.timeline,
                                        color: Colors.white, size: 30.0),
                                  )))
                            ]),
                      ),
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/invoices',
                                arguments: user);
                          },
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                    color: Colors.teal,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(Icons.settings_applications,
                                          color: Colors.white, size: 30.0),
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text('Shipments',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22.0)),
                                Text('All shipments',
                                    style: TextStyle(color: Colors.black45)),
                              ]),
                        ),
                      ),
                    ),
                    _buildTile(
                      Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/track',
                              );
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Material(
                                      color: Colors.amber,
                                      shape: CircleBorder(),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(Icons.notifications,
                                            color: Colors.white, size: 30.0),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 16.0)),
                                  Text('Track',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22.0)),
                                  Text('Track shipment ',
                                      style: TextStyle(color: Colors.black45)),
                                ]),
                          )),
                    ),
                    _buildTile(
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Pending Delivery',
                                        style:
                                            TextStyle(color: Colors.redAccent)),
                                    Text("${snapshot.data.pendingShipments}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 34.0))
                                  ],
                                ),
                                Material(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(24.0),
                                    child: Center(
                                        child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Icon(Icons.store,
                                          color: Colors.white, size: 30.0),
                                    )))
                              ]),
                        ),
                        onTap: () => {
                              // Navigator.of(context).push(
                              //     MaterialPageRoute(builder: (_) => ShopItemsPage())),
                            }),
                    _buildTile(
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Delivered',
                                        style: TextStyle(
                                            color: Colors.greenAccent)),
                                    Text("${snapshot.data.deliveredShipments}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 34.0))
                                  ],
                                ),
                                Material(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(24.0),
                                    child: Center(
                                        child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Icon(Icons.store,
                                          color: Colors.white, size: 30.0),
                                    )))
                              ]),
                        ),
                        onTap: () => {
                              // Navigator.of(context).push(
                              //     MaterialPageRoute(builder: (_) => ShopItemsPage())),
                            })
                  ],
                  staggeredTiles: [
                    StaggeredTile.extent(2, 110.0),
                    StaggeredTile.extent(1, 180.0),
                    StaggeredTile.extent(1, 180.0),
                    StaggeredTile.extent(2, 110.0),
                    StaggeredTile.extent(2, 110.0),
                  ],
                );
              }
            }));
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }
}
