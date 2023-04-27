import 'package:chat_app/components/app_bar.dart';
import 'package:chat_app/components/drawer.dart';
import 'package:chat_app/components/tab_bar.dart';
import 'package:chat_app/components/tab_bar_view.dart';
import 'package:chat_app/consts/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          key: scaffoldKey,
          drawer: drawer(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: bgColor,
            child: const Icon(Icons.add),
          ),
          backgroundColor: bgColor,
          body: Column(
            children: [
              appBar(scaffoldKey),
              Expanded(
                child: Row(
                  children: [
                    tabbar(),
                    tabbarview(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
