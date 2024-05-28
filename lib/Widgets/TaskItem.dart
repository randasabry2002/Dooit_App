import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import '../Screens/UpdateTask.dart';

class TaskItem extends StatefulWidget {
  String? title;
  String? dueDate;
  String? label;

  String? id;

  TaskItem({super.key, this.title,this.dueDate,this.label,this.id,});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool isCompleted=false;

  deleteTask() async {
    await firestore.collection("Tasks").doc(widget.id).delete();
  }

  // changeTaskState() async {
  //   try {
  //     print(widget.state.toString());
  //     // if(widget.state==0 || widget.state==1){
  //       await firestore.collection("Tasks").doc(widget.id).update({
  //         'Status': widget.state,
  //       });
  //     // }
  //   } catch (e) {
  //     // Handle errors
  //     print("Error updating task: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // print(id);
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Card(
        color: Color(0xffe4ebf8),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title!,
              style: TextStyle(
                color: Color(0xff185abd),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Row(
            //   children: [
            //     InkWell(
            //       onTap: (){
            //         setState(() {
            //           // if(widget.state==1){
            //           //   widget.state=0;
            //           // }else if(widget.state==0){
            //           //   widget.state=1;
            //           // }
            //         });
            //         // Timer(Duration(milliseconds: 300), () {
            //         //   changeTaskState();
            //         // });
            //       },
            //       // child: Container(height: 28,width: 100,
            //       //   padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
            //       //   decoration: BoxDecoration(
            //       //     color: widget.state==2 ? Colors.green.withOpacity(0.5): widget.state==1? Colors.yellow.withOpacity(0.5): Colors.red.withOpacity(0.5),
            //       //     // border: Border.all(
            //       //     //   color: Colors.black, // Border color
            //       //     //   width: 1.0, // Border width
            //       //     // ),
            //       //     borderRadius: BorderRadius.circular(15.0), // Optional: border radius
            //       //   ),
            //       //   child: Center(
            //       //     child: Text(
            //       //       widget.state==2 ? "Completed": widget.state==1? "On Going": "To Do",
            //       //       style: TextStyle(
            //       //         fontSize: 15.0,
            //       //         fontWeight: FontWeight.bold,
            //       //       ),
            //       //     ),
            //       //   ),
            //       // ),
            //     ),
            //
            //     Spacer(),
            //     IconButton(
            //       icon: Icon(Icons.create,color: Color(0xff185abd),),
            //       onPressed: () {
            //         // Handle delete action
            //         // Get.to(UpdateTask(id: widget.id,));
            //       },
            //     ),
            //
            //     IconButton(
            //       icon: Icon(Icons.delete,color: Color(0xff185abd)),
            //       onPressed: () {
            //         // Handle delete action
            //         deleteTask();
            //       },
            //     ),
            //
            //     // IconButton(
            //     //   icon: widget.state==2
            //     //       ? Icon(Icons.check_circle, color: Colors.green) // If completed, show check mark icon
            //     //       : Icon(Icons.radio_button_unchecked,color: Color(0xff185abd)), // Otherwise, show empty circle icon
            //     //   onPressed: () {
            //     //     setState(() {
            //     //       // isCompleted = !isCompleted; // Toggle completion state
            //     //       if(widget.state==2){
            //     //         widget.state=0;
            //     //       }else{
            //     //         widget.state=2;
            //     //       }
            //     //     });
            //     //     Timer(Duration(milliseconds: 100), () {
            //     //       changeTaskState();
            //     //     });
            //     //   },
            //     // ),
            //
            //   ],
            // ),
            // SizedBox(height: 8.0),
            // Row(
            //   children: [
            //     Text(
            //       widget.dueDate!,
            //       style: TextStyle(
            //         color: Color(0xff185abd),
            //         fontSize: 16.0,
            //       ),
            //     ),
            //     Spacer(),
            //
            //   ],
            // ),
          ],
        ),
      ),
    )
    );

  }
}
