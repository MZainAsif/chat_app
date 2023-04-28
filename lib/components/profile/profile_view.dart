import 'dart:io';

import 'package:chat_app/components/picker_dialog.dart';
import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/firebase_const.dart';
import 'package:chat_app/consts/images.dart';
import 'package:chat_app/consts/strings.dart';
import 'package:chat_app/consts/utils.dart';
import 'package:chat_app/controller/profile_controller.dart';
import 'package:chat_app/services/store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: bgColors,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: profile.text.bold.make(),
        actions: [
          TextButton(
            onPressed: () {
              controller.updateProfile(context);
            },
            child: "Save".text.white.semiBold.make(),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: FutureBuilder<QuerySnapshot<Object?>>(
            future: StoreServices.getUser(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!.docs[0];
                controller.nameController.text = data['name'];
                controller.phoneController.text = data['phone'];
                controller.aboutController.text = data['about'];
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: btnColor,
                      child: Stack(
                        children: [
                          controller.imagePath.isEmpty
                              ? Image.asset(
                                  icUser,
                                  color: Colors.white,
                                )
                              : Image.file(
                                  File(controller.imagePath.value),
                                ).box.roundedFull.clip(Clip.antiAlias).make(),
                          Positioned(
                            right: 0,
                            bottom: 20,
                            child: CircleAvatar(
                              backgroundColor: btnColor,
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                              ).onTap(() {
                                Get.dialog(pickerDialog(context, controller));
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    const Divider(
                      color: btnColor,
                      height: 1,
                    ),
                    10.heightBox,
                    ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: TextFormField(
                        controller: controller.nameController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          label: "Name".text.make(),
                          isDense: true,
                          labelStyle: const TextStyle(
                            fontFamily: semibold,
                            color: Vx.white,
                          ),
                        ),
                      ),
                      subtitle: namesub.text.semiBold.gray400.make(),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: TextFormField(
                        controller: controller.aboutController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          label: "About".text.make(),
                          isDense: true,
                          labelStyle: const TextStyle(
                            fontFamily: semibold,
                            color: Vx.white,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      title: TextFormField(
                        controller: controller.phoneController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        readOnly: true,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: "Phone".text.make(),
                          isDense: true,
                          labelStyle: const TextStyle(
                            fontFamily: semibold,
                            color: Vx.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                );
              }
            }),
      ),
    );
  }
}
