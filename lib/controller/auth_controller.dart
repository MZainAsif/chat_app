import 'package:chat_app/consts/firebase_const.dart';
import 'package:chat_app/consts/strings.dart';
import 'package:chat_app/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  var usernameController = TextEditingController();
  var phonenumberController = TextEditingController();
  var otpController = List.generate(6, (index) => TextEditingController());

  var isOtpSent = false.obs;
  var formKey = GlobalKey<FormState>();

  late final PhoneVerificationCompleted phoneVerificationCompleted;
  late final PhoneVerificationFailed phoneVerificationFailed;
  late PhoneCodeSent phoneCodeSent;
  String verificationID = '';

  sendOtp() async {
    phoneVerificationCompleted = (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    };
    phoneVerificationFailed = (FirebaseAuthException e) {
      if (e.code == 'Invalid phone Number') {
        // ignore: avoid_print
        print('The provided phone number is not valid');
      }
    };
    phoneCodeSent = (String verificationId, int? resendToken) {
      verificationID = verificationId;
    };

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+92${phonenumberController.text}",
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  verifyOtp(context) async {
    String otp = '';
    for (var i = 0; i < otpController.length; i++) {
      otp += otpController[i].text;
    }

    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationID,
        smsCode: otp,
      );
      final User? user =
          (await auth.signInWithCredential(phoneAuthCredential)).user;
      if (user != null) {
        DocumentReference store =
            FirebaseFirestore.instance.collection(collectionUser).doc(user.uid);
        await store.set(
            {
              'id': user.uid,
              "name": usernameController.text.toString(),
              "phone": phonenumberController.text.toString(),
              "about": '',
              "image_url": '',
            },
            SetOptions(
              merge: true,
            ));
        VxToast.show(
          context,
          msg: logedin,
        );
        Get.offAll(() => const HomePage(), transition: Transition.upToDown);
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
