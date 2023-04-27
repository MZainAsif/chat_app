import 'package:chat_app/consts/firebase_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileController extends GetxController {
  var nameController = TextEditingController();
  var aboutController = TextEditingController();
  var phoneController = TextEditingController();

  var imgpath = ''.obs;
  var imglink = '';
  RxString imagePath = ''.obs;

  updateProfile(context) async {
    var store =
        firebaseFirestore.collection(collectionUser).doc(currentUser!.uid);

    await store.set(
        {
          'name': nameController.text,
          "about": aboutController.text,
        },
        SetOptions(
          merge: true,
        ));
    VxToast.show(
      context,
      msg: 'Profile Updated Successfully',
    );
  }

  // pickImage(context, source) async {
  //   await Permission.photos.request();
  //   await Permission.camera.request();
  //   var status = await Permission.photos.status;

  //   if (status.isGranted) {
  //     try {
  //       final img =
  //           await ImagePicker().pickImage(source: source, imageQuality: 80);
  //       imgpath.value = img!.path;
  //       VxToast.show(context, msg: 'Image Selected');
  //     } on PlatformException catch (e) {
  //       VxToast.show(context, msg: e.toString());
  //     }
  //   } else {
  //     VxToast.show(context, msg: 'Permission Denied');
  //   }
  // }

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future getsImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}
