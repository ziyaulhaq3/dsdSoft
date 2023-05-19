// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:dsdmob/auth/signup.dart';
import 'package:dsdmob/screens/Dashboard.dart';

import '../routes/routes.dart';
import 'customShape.dart';

class getStarted extends StatefulWidget {
  const getStarted({Key? key});

  @override
  State<getStarted> createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 500,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 248, 229, 200),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/dsdsoftlogo.png"),
                    const SizedBox(
                      height: 5,
                      width: 5,
                    ),
                  ]),
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            child: SwipeableButtonView(
              buttonText: "Get Started",
              buttonWidget: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
              ),
              activeColor: Colors.orange,
              isFinished: isFinished,
              onWaitingProcess: () {
                isFinished = true;
                setState(() {});
                // Future.delayed(Duration(seconds: 1), () {
                // });
                print("done $isFinished");
              },
              onFinish: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => signup()),
                );

                //TODO: For reverse ripple effect animation
                setState(() {
                  isFinished = false;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
