import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list_app_with_flutter/screens/HomeScreen.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddTaskState();
  }
}

class AddTaskState extends State<StatefulWidget> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  String label ="";
  bool pinned=false;
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // _dateController.text = picked.toString();

        _dateController.text = DateFormat('yyyy-MM-dd')
            .format(picked); // Set the selected date to the text field
      });
    }
  }

  // addTask() {
  //   firestore.collection("Tasks").add({
  //     "Title": _titleController.text.toString(),
  //     "Due Date": _dateController.text,
  //     "Name": _nameController.text.toString(),
  //     "Date": DateTime.now(),
  //     "Status": 0,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: AppBar(
                leading: const Padding(
                  padding: EdgeInsets.fromLTRB(20,20,20,0),
                  child: Icon(Icons.arrow_back,size: 40,)
                ),
                // leadingWidth: 40,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,20,20,0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if(pinned){
                            pinned=false;
                          }
                          else{
                            pinned=true;
                          }
                        });
                      },
                      child: Container(
                        height: 35,
                        width: 80,// Adjust height as needed
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.black,width: 2),
                          color: pinned?Colors.black:Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/pin_icon.svg',
                              width: 10,
                              color: pinned?Colors.white:Colors.black,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              'Pin',
                              style:
                              TextStyle(fontSize: 20, color: pinned?Colors.white:Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(labelText: "Title",),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: 'Due Date',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Icon(Icons.calendar_month),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Choose a label ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Graphik'),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  label="Personal";
                                });
                                // print('All Tasks part tapped!');
                              },
                              child: Container(
                                height: 40, // Adjust height as needed
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  color: label=="Personal"?Colors.black:Colors.grey,
                                ),
                                child: const Text(
                                  'Personal',
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  label="Work";
                                });
                                // print('Pinned part tapped!');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  color: label=="Work"?Colors.black:Colors.grey,
                                ),
                                height: 40, // Adjust height as needed
                                alignment: Alignment.center,
                                child: Text(
                                  'Work',
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  label="Finance";
                                });
                                // print('Pinned part tapped!');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  color: label=="Finance"?Colors.black:Colors.grey,
                                ),
                                height: 40, // Adjust height as needed
                                alignment: Alignment.center,
                                child: Text(
                                  'Finance',
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  label="Other";
                                });
                                // print('Pinned part tapped!');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  color: label=="Other"?Colors.black:Colors.grey,
                                ),
                                height: 40, // Adjust height as needed
                                alignment: Alignment.center,
                                child: Text(
                                  'Other',
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
                  SizedBox(height: 250  ,),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,30,0),
                    child: Container(
                      // width: 150,
                      alignment: Alignment.bottomRight,
                      height: 44.34,
                      child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0), // Adjust radius as needed
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          Get.to(HomeScreen());
                          // if (_titleController.text == "") {
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(const SnackBar(
                          //     content: Text("Enter Title"),
                          //   ));
                          // } else if (_nameController.text == "") {
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(const SnackBar(
                          //     content: Text("Enter Name"),
                          //   ));
                          // } else {
                          //   addTask();
                          //   Get.offAll(HomePage());
                          // }
                        },
                        child: Text(
                          'Save Task',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.98,
                              fontFamily: 'Graphik'),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            )));
  }
}
