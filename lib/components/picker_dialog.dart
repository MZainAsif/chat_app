import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

Widget pickerDialog(context, controller) {
  var listTile = [camera, gallery, cancel];
  var icons = [
    Icons.camera_alt_rounded,
    Icons.photo_size_select_actual_rounded,
    Icons.cancel_rounded,
  ];

  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      padding: const EdgeInsets.all(12),
      color: bgColors,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          source.text.white.size(16).semiBold.make(),
          const Divider(),
          10.heightBox,
          ListView(
            shrinkWrap: true,
            children: List.generate(
              3,
              (index) => ListTile(
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.back();
                      controller.getImage();
                      break;
                    case 1:
                      Get.back();
                      controller.getsImage();
                      break;
                    case 2:
                      Get.back();
                      break;
                  }
                },
                leading: Icon(
                  icons[index],
                  color: Colors.white,
                ),
                title: listTile[index].text.white.make(),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
