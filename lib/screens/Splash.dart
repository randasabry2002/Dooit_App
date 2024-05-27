import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app_with_flutter/screens/HomeScreen.dart';
class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0,250,0,0),
              child: Column(
                // margin: EdgeInsets.fromLTRB(0,200.0,0,0),
                children: [
                  Center(
                      child: Image.asset(
                    'assets/images/logo.png',
                    width: 67.96,
                    height: 55,
                  )),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Container(
                    width: 189,
                    // height: 106.5,
                    child: const Column(
                      children: [
                        Text(
                          "Dooit",
                          style: TextStyle(
                              fontSize: 39.08,
                              color: Colors.white,
                              fontFamily: 'Graphik'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Write what you need to do. Everyday.  ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFC4C4C4),
                              fontSize: 18.98,
                              fontFamily: 'Graphik'),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.fromLTRB(0,0,0,50),
              width: 199,
              height: 53,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Get.to(HomeScreen());
                },
                child: const Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.98,
                      fontFamily: 'Graphik'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
