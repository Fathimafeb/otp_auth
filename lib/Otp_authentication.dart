import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_auth/Phone.dart';

class Otp1 extends StatefulWidget {
  const Otp1({super.key});
  static String code = "";

  @override
  State<Otp1> createState() => _Otp1State();
}

class _Otp1State extends State<Otp1> {
  var phone='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter Your phonenumber"),
            Container(
              height: 50,
              width: double.infinity,
              child: TextFormField(onChanged: (value) {
                phone= value;
              },
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)),
              ),
            ),
            SizedBox(height: 30,),
           ElevatedButton(

               onPressed: () async{
                 await FirebaseAuth.instance.verifyPhoneNumber(
                   phoneNumber: '+91$phone',
                   verificationCompleted: (PhoneAuthCredential credential) {},
                   verificationFailed: (FirebaseAuthException e) {},
                   codeSent: (String verificationId, int? resendToken) {
                     Otp1.code=verificationId;
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Phone(),));},
                   codeAutoRetrievalTimeout: (String verificationId) {},
                 );
    Navigator.push(context, MaterialPageRoute(builder: (context) => Phone(),));
           }, child: Text('Submit',style: TextStyle(color: Colors.black),))
          ],
        ),
      )
    );
  }
}
