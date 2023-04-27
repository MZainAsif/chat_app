import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/images.dart';
import 'package:chat_app/consts/utils.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColors,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: const [
          Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(22),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Username\n",
                            style: TextStyle(
                              fontFamily: semibold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "Last Seen",
                            style: TextStyle(
                              fontFamily: semibold,
                              fontSize: 12,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: btnColor,
                    child: Icon(
                      Icons.video_call_rounded,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  10.widthBox,
                  const CircleAvatar(
                    backgroundColor: btnColor,
                    child: Icon(
                      Icons.call,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            30.heightBox,
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Directionality(
                    textDirection:
                        index.isEven ? TextDirection.rtl : TextDirection.ltr,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: index.isEven ? bgColors : btnColor,
                            child: Image.asset(
                              icUser,
                              color: Colors.white,
                            ),
                          ),
                          20.widthBox,
                          Expanded(
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: index.isEven ? bgColors : btnColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: "Hello, this is a dumy message..."
                                    .text
                                    .semiBold
                                    .white
                                    .make(),
                              ),
                            ),
                          ),
                          10.widthBox,
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: "11:00 AM"
                                .text
                                .color(greyColor)
                                .size(12)
                                .make(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            10.heightBox,
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: bgColors,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextFormField(
                        maxLines: 1,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: semibold,
                          fontSize: 14,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type your message here',
                          hintStyle: TextStyle(
                            fontFamily: semibold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          prefixIcon: Icon(
                            Icons.emoji_emotions_rounded,
                            color: Colors.white,
                          ),
                          suffixIcon: Icon(
                            Icons.attachment_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  20.widthBox,
                  const CircleAvatar(
                    backgroundColor: btnColor,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
