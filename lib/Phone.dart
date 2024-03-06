import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_auth/Otp_authentication.dart';
import 'package:otp_auth/home.dart';
import 'package:pinput/pinput.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var otp = '';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter your otp'),
          Padding(
              padding: const EdgeInsets.all(28.0),
              child: Pinput(
                  length: 6,
                  showCursor: true,
                  onChanged: (value) {
                    otp = value;
                  })),
          ElevatedButton(
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: Otp1.code, smsCode: otp);

                await auth.signInWithCredential(credential);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
              },
              child: Text('send the code')),
        ],
      ),
    );
  }
}
