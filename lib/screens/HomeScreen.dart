import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list_app_with_flutter/screens/AddTask.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Widgets/TaskItem.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<StatefulWidget> {
  bool allTasksTaped = true; // all or pinned
  bool pinnedTaped = false; // all or pinned
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(20)),
                      color: Color(0xffE5E5E5),
                    ),
                    child: Row(
                      children: [
                        Expanded(flex: allTasksTaped?6:5,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                allTasksTaped = true;
                                pinnedTaped = false;
                              });
                              // print('All Tasks part tapped!');
                            },
                            child: Container(
                              height: 55, // Adjust height as needed
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: allTasksTaped?Colors.black:Color(0xc3e5e5e5),
                              ),
                              child: const Text(
                                'All Tasks',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: pinnedTaped ? 6:5,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                allTasksTaped = false;
                                pinnedTaped = true;
                              });
                              // print('Pinned part tapped!');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                color: pinnedTaped ? Colors.black : Color(
                                    0xc3e5e5e5),
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
                ),
                ///**********************************
                StreamBuilder<QuerySnapshot>(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<TaskItem> allTasks = [];
                      var responseTasks = snapshot.data!.docs;
                      allTasks.clear();
                      for (var i = 0; i < responseTasks.length; i++) {
                        String title = responseTasks[i].get('Title');
                        String? dueDate = responseTasks[i].get('Due Date');
                        String? label = responseTasks[i].get('Label');
                        bool? done=responseTasks[i].get('Done');
                        bool? pinned=responseTasks[i].get('Pinned');

                        // if (state == 1 || state == 0) {
                          allTasks.add(TaskItem(
                            title: title,
                            dueDate: dueDate,
                            label: label,
                            id: responseTasks[i].id,
                          ));
                          print(responseTasks[i].id);
                        // }
                      }
                      if (allTasks.isEmpty) {
                        return Column(
                          children: [
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
                              "Create your first to-do task...",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Graphik'),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
                              width: 150,
                              // alignment: Alignment.center,
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
                                  Get.to(AddTask());
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ), // Prefix icon
                                    Text(
                                      'New Task ',
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
                        );
                      }
                      return Expanded(
                        child: Stack(
                          children: [
                            ListView(
                            physics: BouncingScrollPhysics(),
                            children: allTasks,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: FloatingActionButton(
                                  backgroundColor: Colors.black,
                                  onPressed: () {
                                    Get.to(AddTask());
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: Text("Wait a Second"));
                    }
                  },
                  stream: firestore
                      .collection("Tasks")
                      .orderBy("Date", descending: true)
                      .snapshots(),
                ),

              ],
            )));
  }
}
