import 'package:chat_app/components/chats.dart';
import 'package:chat_app/components/status.dart';
import 'package:flutter/material.dart';

Widget tabbarview() {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: TabBarView(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
              ),
              color: Colors.white,
            ),
            child: chatComponent(),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
              ),
              color: Colors.white,
            ),
            child: statusComponent(),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
              ),
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    ),
  );
}
