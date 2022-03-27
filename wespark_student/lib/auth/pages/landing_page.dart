import 'package:flutter/material.dart';
import 'package:wespark_student/auth/widgets/auth_gate.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthGate();
   
  }
}