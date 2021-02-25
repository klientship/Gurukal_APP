import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('User Information'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/team.png'),
                radius: 80.0,
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Chip(
                padding: EdgeInsets.all(0),
                backgroundColor: Colors.green,
                label: Text('Active', style: TextStyle(color: Colors.white)),
              ),
            ),
            Divider(
              height: 40.0,
              color: Colors.black,
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.black,
                  size: 28.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  'test@gurukal.in',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.phone_android,
                  color: Colors.black,
                  size: 28.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  '09148850331',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.black,
                  size: 28.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  'Divya Enclave, Ground \nFloor, near canara college',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  ' Registration Date : ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  '2020-07-06',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
