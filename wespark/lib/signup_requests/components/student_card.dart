import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:wespark/home/widgets/tags_component.dart';
import 'package:wespark/signup_requests/models/student_card_model.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({
    Key? key,
    required this.studentCardModel,
  }) : super(key: key);
  final StudentCardModel studentCardModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text("${studentCardModel.name}"),
                content:Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${studentCardModel.studentEmail}"),
                    Text("Volunteer Count : ${studentCardModel.volunteerCount}"),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text("Close"),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
        });
      },
        child: Container(child: Text(studentCardModel.name),))
    );
  }
}



class StudentCardContent extends StatelessWidget {
  const StudentCardContent({
    Key? key,
    required this.title,
    required this.tags,
  }) : super(key: key);
  final String title;
  final List tags;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueGrey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 8, top: 4),
              child: Text(
                title,
                textAlign: TextAlign.left,
                textScaleFactor: 1.2,
                style: const TextStyle(
                  fontFamily: "nunito",
                  color: Colors.black,
                ),
                softWrap: true,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 8, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("hey")],
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Padding(
            //       padding: const EdgeInsets.only(left: 18.0, bottom: 8, top: 4),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           ...tags.map((e) {
            //             return TagsComponent(
            //               color: Color(0xff4e4e4e),
            //               tagName: e.toString(),
            //             );
            //           }),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class StudentCardTitle extends StatelessWidget {
  const StudentCardTitle({
    Key? key,
    required this.weekday,
    required this.date,
  }) : super(key: key);
  final String weekday;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13), topRight: Radius.circular(13)),
        color: Color(0xff5C589C),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 8, top: 8),
                child: Text(
                  weekday,
                  softWrap: true,
                  // textScaleFactor: 2,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      fontFamily: "nunito",
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1.5, bottom: 7.5, left: 18),
                child: Text(
                  date,
                  textScaleFactor: 1.2,
                  softWrap: true,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

