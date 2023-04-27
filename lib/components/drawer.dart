import 'package:chat_app/components/profile/profile_view.dart';
import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/firebase_const.dart';
import 'package:chat_app/consts/images.dart';
import 'package:chat_app/consts/strings.dart';
import 'package:chat_app/consts/utils.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

Widget drawer() {
  return Drawer(
    backgroundColor: bgColors,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(25),
      ),
    ),
    child: Column(
      children: [
        ListTile(
          onTap: () {
            Get.back();
          },
          leading: const Icon(
            backIcon,
            color: Colors.white,
          ),
          title: settings.text.fontFamily(semibold).color(Colors.white).make(),
        ),
        20.heightBox,
        CircleAvatar(
          radius: 45,
          backgroundColor: btnColor,
          child: Image.asset(
            icUser,
            color: Colors.white,
          ),
        ),
        10.heightBox,
        "UserName".text.white.semiBold.size(16).make(),
        20.heightBox,
        const Divider(color: bgColor, height: 1),
        10.heightBox,
        ListView(
          shrinkWrap: true,
          children: List.generate(
            drawerIconsList.length,
            (index) => ListTile(
              onTap: () {
                switch (index) {
                  case 0:
                    Get.to(() => const ProfileScreen());
                    break;
                  default:
                }
              },
              leading: Icon(
                drawerIconsList[index],
                color: Colors.white,
              ),
              title: drawerListTiles[index].text.white.make(),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(color: Colors.black, height: 2),
        10.heightBox,
        ListTile(
          leading: const Icon(
            inviteIcon,
            color: Colors.white,
          ),
          title: invite.text.semiBold.white.make(),
        ),
        const Spacer(),
        ListTile(
          onTap: () async {
            await auth.signOut();
            Get.offAll(const HomeScreen());
          },
          leading: const Icon(
            logoutIcon,
            color: Colors.white,
          ),
          title: logout.text.semiBold.white.make(),
        ),
      ],
    ),
  );
}
