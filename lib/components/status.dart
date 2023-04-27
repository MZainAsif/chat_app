import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/images.dart';
import 'package:chat_app/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget statusComponent() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: btnColor,
            child: Image.asset(
              icUser,
              color: Colors.white,
            ),
          ),
          title: "My Status".text.semiBold.color(txtColor).make(),
          subtitle: "Tap to add status updates".text.gray400.make(),
        ),
        20.heightBox,
        recentupdates.text.semiBold.color(txtColor).make(),
        20.heightBox,
        ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: btnColor,
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Vx.randomColor,
                      child: Image.asset(
                        icUser,
                      ),
                    ),
                  ),
                  title: "Username".text.semiBold.color(txtColor).make(),
                  subtitle: "Today, 08:47 PM".text.gray400.make(),
                ),
              );
            }),
      ],
    ),
  );
}
