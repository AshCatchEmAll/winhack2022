import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("Students").doc(FirebaseAuth.instance.currentUser!.uid).get(),
          builder: (context, snapshot) {
            var studentDoc = snapshot.data as Map<String, dynamic>;
            return ProfileComponent(
              email: studentDoc["email"],
              avatar: studentDoc["avatar"],
              name: studentDoc["name"],
              count: studentDoc["count"],
              description: studentDoc["description"],
            );
          }),
    );
  }
}

class ProfileComponent extends StatelessWidget {
  ProfileComponent({
    Key? key,
    required this.email,
    required this.avatar,
    required this.name,
    required this.count,
    required this.description,
  }) : super(key: key);
  final String email;
  final String? avatar;
  final String? name;
  final String? description;
  final int? count;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.deepOrange, Colors.pinkAccent])),
            child: Container(
              width: double.infinity,
              height: 350.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/avatar.png",
                        ),
                        radius: 50.0,
                      ),
                    SizedBox(
                      height: 10.0,
                    ),
                    name == null
                        ? Container(
                            width: 200,
                            padding: const EdgeInsets.only(
                                bottom: 8, left: 1, right: 1),
                            child: TextField(
                              controller: nameCtrl,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromRGBO(33, 33, 33, 0.08),
                                  hintText: 'Enter your name',
                                  filled: true,
                                  focusColor: Colors.white,
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                          )
                        : Text(
                           name.toString(),
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Volunteer Count",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    count == null ? "0" : count.toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
        Container(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Info:",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0),
                ),
               const SizedBox(
                  height: 10.0,
                ),
                description == null
                    ? TextField(
                        controller: descCtrl,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                            fillColor:  Color.fromRGBO(33, 33, 33, 0.08),
                            hintText: 'Enter your bio',
                            filled: true,
                            focusColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      )
                    : Text(
                        description.toString(),
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          letterSpacing: 2.0,
                        ),
                      ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        // ElevatedButton(
        //     style: ElevatedButton.styleFrom(primary: Colors.redAccent),
        //     onPressed: () {

        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(
        //         "Contact me",
        //         style: TextStyle(fontSize: 20),
        //       ),
        //     )),
      ],
    );
  }
}
