import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dsdmob/screens/paymentform.dart';
import '../config/config.dart';

class paymentData extends StatefulWidget {
  final email;
  const paymentData({@required this.email, super.key});

  @override
  State<paymentData> createState() => _paymentDataState();
}

class _paymentDataState extends State<paymentData> {
  List? items;
  late String email = widget.email;
  @override
  void initState() {
    super.initState();
    email = widget.email;
    getpaymentData(widget.email);
  }

  void getpaymentData(email) async {
    var regBody = {"email": widget.email};
    var response = await http.post(
      Uri.parse(getPaymentdata),
    headers :{"Content-Type": "application/json"},
    body : jsonEncode(regBody));
    //print(response.statusCode);
    var res = jsonDecode(response.body);
    items = res["success"];
    print(items);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("paymentData"),
        titleTextStyle: TextStyle(
          //backgroundColor: Colors.orange,
          
        fontWeight: FontWeight.bold,
        fontSize: 20,
        ),
      ),*/
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('PAYMENTS'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Monsterrat-Regular',
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: items == null
                  ? null
                  : ListView.builder(
                      itemCount: items!.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          //borderOnForeground: false,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Card(
                              shadowColor: Colors.grey,
                              color: Colors.grey[100],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'paymentId - ${items![index]['paymentId']}'),
                                          Text(
                                              'customerName - ${items![index]['customerName']}'),
                                          Text(
                                              'balance - ${items![index]['balance']}')
                                        ]),
                                        Text("status - ",),
                                    IconButton(
                                      alignment: Alignment.bottomRight,
                                      onPressed: () {
                                        //action coe when button is pressed
                                      },
                                      icon: Icon(Icons.edit_note),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }))),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.orange,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentForm(
                          email: widget.email,
                        )));
          }),
    );
  }
}
