import 'package:cloud_firestore/cloud_firestore.dart';

class StudentCardModel {
  StudentCardModel(
      {this.avatar,
      required this.id,
      required this.duration,
    required this.volunteerCount,
      required this.name,
      required this.studentEmail});

  final String? avatar;
  final String duration;
  final String id;
final int  volunteerCount;
  final String name;
  final String studentEmail;

  factory StudentCardModel.fromFirebase(Map<String, dynamic> json, String id) {
    return StudentCardModel(
      id: id,
 volunteerCount: json['volunteerCount']??0,
      avatar: json['avatar'],
      duration: json['duration'] ?? "No duration specified",
      name: json['name'] ?? "No name specified",
      studentEmail: json['email'] ?? "No email specified",
    );
  }

  Map toJson() {
    return {
      'volunteerCount': volunteerCount,
      'avatar': avatar,
      'id': id,
      'duration': duration,
      'name': name,
      'email': studentEmail,
    };
  }
}
