// Scaffold(
// appBar: AppBar(
// title: Text("More"),
// backgroundColor: Colors.orangeAccent,
// ),
//   body: ListView.builder(
//     itemCount: items.length,
//     itemBuilder: (context, index) {
//       return Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Stack(
//             children: <Widget> [
//               Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(_borderRadius),
//                   gradient: LinearGradient(
//                     colors: [  items[index].startColor,  items[index].endColor ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color:  items[index].endColor,
//                       blurRadius: 6,
//                       offset: Offset(0,6),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget> [
//                     SizedBox(height: 16),
//                     Icon(
//                       Icons.audiotrack,
//                       color: Colors.white,
//                       size: 30.0,
//                     ),
//                     Text(
//                       items[index].name,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontFamily: 'Avenir',
//                           fontWeight: FontWeight.w500
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   ),
// );
//================================================================================
// Widget _buildEmail() {
//   return TextFormField(
//     decoration: InputDecoration(labelText: 'Email',
//         border:OutlineInputBorder(),suffixIcon: Icon(Icons.email)),
//     keyboardType: TextInputType.emailAddress,
//     validator: (String value){
//       if (value.isEmpty){
//         return 'Email is Required';
//       }
//       if(!RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$").hasMatch(value)){
//         return 'Please Enter valid email address';
//       }
//       return null;
//     },
//     onSaved: (String value){
//       _email = value;
//     },
//     // obscureText: true,
//   );
// }
//===============================================================================================================================
// Widget _buildPassword() {
//   return TextFormField(
//     decoration: InputDecoration(labelText: 'Password',
//         border:OutlineInputBorder(),
//         suffixIcon: IconButton(
//           icon: Icon(_secureText ? Icons.remove_red_eye:Icons.security),
//           onPressed: () {
//             setState(() {
//               _secureText = ! _secureText;
//             });
//           },
//         )
//     ),
//     keyboardType: TextInputType.visiblePassword,
//     validator: (String value){
//       if (value.isEmpty){
//         return 'Password is Required';
//       }
//       return null;
//     },
//     onSaved: (String value){
//       _password = value;
//     },
//     obscureText: _secureText,
//   );
// }


// suffixIcon: IconButton(
//   icon: Icon(Icons.calendar_today),
//   onPressed: () {
//     showDatePicker(context: context,
//       initialDate: _dateTime == null ? DateTime.now() : _dateTime,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2050),
//     ).then((date) {
//       setState(() {
//         _dateTime = date;
//         print(_dateTime);
//
//       });
//     });
//   },
// ),

// maxLength: 10,
// maxLines: 3,
// keyboardType: TextInputType.datetime,
// validator: (String value){
//   if (value.isEmpty){
//     return 'Date is Required';
//   }
//   return null;
// },

// validator: (String value){
// int calories = int.tryParse(value);
// if (calories == null || calories <= 0){
// return 'Calories must be greater than Zero';
// }
// return null;
// },

//cards animated

// import 'package:flutter/material.dart';
// import 'quote.dart';
//
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//
//
//   List<Quote> quotes = [
//     Quote(author: '₹ 7071684', text: 'TOTAL EARNINGS'),
//     Quote(author: '235', text: 'TOTAL SHIPMENTS'),
//     Quote(author: '12', text: 'PENDING DELIVERY'),
//     Quote(author: '24', text: 'TOTAL QUOTATIONS'),
//     Quote(author: '173', text: 'TOTAL CUSTOMERS'),
//     Quote(author: '1425734', text: 'PENDING PAYMENT'),
//     Quote(author: '77000', text: 'UPCOMING EXPENSES'),
//   ];
//
//
//
//   Widget quoteTemplate(quote){
//     return Card(
//       margin: EdgeInsets.fromLTRB(30.0,30.0,30.0,10.0),
//       child:Padding(
//         padding: const EdgeInsets.all(26.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               quote.text,
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color:Colors.grey[900],
//               ),
//             ),
//             SizedBox(height: 6.0),
//             Text(
//               quote.author,
//               style: TextStyle(
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("GURUKAL LOGISTICS"),
//         backgroundColor: Colors.orangeAccent,
//         centerTitle: true,),
//       body: SingleChildScrollView(
//         child: Column(
//           children: quotes.map((quote) => quoteTemplate(quote)).toList(),
//         ),
//       ),
//
//     );
//   }
// }
