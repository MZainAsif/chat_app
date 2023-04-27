import "package:chat_app/components/chat_screen.dart";
import "package:chat_app/consts/colors.dart";
import "package:chat_app/consts/images.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:velocity_x/velocity_x.dart";

Widget chatComponent() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Get.to(() => const ChatScreen(), transition: Transition.upToDown);
            },
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: btnColor,
              child: Image.asset(
                icUser,
                color: Colors.white,
              ),
            ),
            title: "Dummy Name".text.size(16).semiBold.make(),
            subtitle: "Message here..".text.size(14).make(),
            trailing: Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: null,
                icon: const Icon(
                  Icons.access_time_filled_rounded,
                  size: 16,
                  color: Vx.gray600,
                ),
                label: "Last Seen".text.gray400.size(12).make(),
              ),
            ),
          );
        }),
  );
}
