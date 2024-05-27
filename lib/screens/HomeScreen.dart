import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeStateScreen();
  }
}

class HomeStateScreen extends State<StatefulWidget> {
  bool allListTaped = true; // all or pinned
  bool pinnedTaped = false; // all or pinned
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: SvgPicture.asset(
                    'assets/icons/logo_Icon.svg',
                  ),
                ),
                // leadingWidth: 40,
                title: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    'Dooit',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Graphik',
                        fontSize: 20),
                  ),
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                        weight: 20,
                      ),
                      onPressed: () {
                        // do something
                      },
                    ),
                  )
                ],
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
            ),
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              allListTaped = true;
                              pinnedTaped = false;
                            });
                            // print('All List part tapped!');
                          },
                          child: Container(
                            height: 55, // Adjust height as needed
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: allListTaped?Colors.black:Colors.grey,
                            ),
                            child: Text(
                              'All List',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              allListTaped = false;
                              pinnedTaped = true;
                            });
                            allListTaped = false;
                            pinnedTaped = true;
                            // print('Pinned part tapped!');
                          },
                          child: Container(
                            // margin: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              color: pinnedTaped ? Colors.black : Colors.grey,
                            ),
                            height: 55, // Adjust height as needed
                            alignment: Alignment.center,
                            child: Text(
                              'Pinned',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 100,bottom: 100),
                    child: Image.asset(
                      'assets/images/todo_image.png',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Create your first to-do list...",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Graphik'),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
                  width: 130,
                  height: 44.34,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust radius as needed
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {
                      Get.to(HomeScreen());
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ), // Prefix icon
                        // SizedBox(width: 10),
                        Text(
                          'New List ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.98,
                              fontFamily: 'Graphik'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
