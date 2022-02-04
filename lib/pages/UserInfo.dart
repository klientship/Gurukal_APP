import 'package:flutter/material.dart';

import 'package:gurukal_app/models/UserModel.dart';

import 'package:intl/intl.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final UserModel user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/team.png'),
                radius: 70.0,
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                user.user.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
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
                  user.user.email,
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
                user.user.phone != null
                    ? Text(
                        user.user.phone,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          letterSpacing: 1.0,
                        ),
                      )
                    : Container()
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
                user.user.address != null
                    ? Flexible(
                        child: Text(
                          user.user.address,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Flexible(
                  child: Center(
                    child: Text(
                      'Registration Date : ${DateFormat('dd-MM-yyyy').format(user.user.createdAt)} ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        letterSpacing: 1.0,
                      ),
                    ),
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
