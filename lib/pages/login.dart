import 'package:flutter/material.dart';
import '../controller/login_controller.dart';
import 'package:dio/dio.dart';
// import 'signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    getLogin();
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(90.0, 110.0, 0.0, 0.0),
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  // Container(
                  //   padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                  //   child: Text('There',
                  //       style: TextStyle(
                  //           fontSize: 80.0, fontWeight: FontWeight.bold)),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                  //   child: Text('.',
                  //       style: TextStyle(
                  //           fontSize: 80.0,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.green)),
                  // ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.email)),
                      keyboardType: TextInputType.emailAddress,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Email is Required';
                        }
                        if (!RegExp(
                                r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
                            .hasMatch(value)) {
                          return 'Please Enter valid email address';
                        }
                        return null;
                      },

                      // obscureText: true,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(_secureText
                                ? Icons.remove_red_eye
                                : Icons.security),
                            onPressed: () {
                              setState(() {
                                _secureText = !_secureText;
                              });
                            },
                          )),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Password is Required';
                        }
                        return null;
                      },
                      obscureText: _secureText,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/dashboard');
                          },
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                )),
            SizedBox(height: 15.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Text(
            //       'New to Spotify ?',
            //       style: TextStyle(fontFamily: 'Montserrat'),
            //     ),
            //     SizedBox(width: 5.0),
            //     InkWell(
            //       onTap: () {
            //         Navigator.of(context).pushNamed('/signup');
            //       },
            //       child: Text(
            //         'Register',
            //         style: TextStyle(
            //             color: Colors.green,
            //             fontFamily: 'Montserrat',
            //             fontWeight: FontWeight.bold,
            //             decoration: TextDecoration.underline),
            //       ),
            //     )
            //   ],
            // )
          ],
        )); 
  }
}

void getLogin() async {
  var response = await Dio().get('https://crm.gurukal.in/api/customers/28');
  print(response.data);
}
