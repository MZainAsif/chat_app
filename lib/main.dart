import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/firebase_const.dart';
import 'package:chat_app/consts/images.dart';
import 'package:chat_app/consts/strings.dart';
import 'package:chat_app/screens/home.dart';
import 'package:chat_app/screens/verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isUser = false;

  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        setState(() {
          isUser = false;
        });
      } else {
        setState(() {
          isUser = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkUser();
    // ignore: avoid_print
    print('Zain');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(fontFamily: "lato"),
      home: isUser ? const HomePage() : const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    logo,
                    width: 120,
                  ),
                  appname.text.size(32).bold.make(),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 7.0,
                    children: List.generate(listOfFeatures.length, (index) {
                      return Chip(
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: 17,
                            vertical: 4,
                          ),
                          backgroundColor: Colors.transparent,
                          side: const BorderSide(
                            color: Vx.gray400,
                          ),
                          label: listOfFeatures[index]
                              .text
                              .semiBold
                              .gray600
                              .make());
                    }),
                  ),
                  slogan.text.size(36).bold.letterSpacing(2).make(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    width: context.screenWidth - 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bgColor,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.all(18),
                      ),
                      onPressed: () {
                        Get.to(() => const VerificationScreen(),
                            transition: Transition.downToUp);
                      },
                      child: cont.text.semiBold.size(16).make(),
                    ),
                  ),
                  10.heightBox,
                  poweredby.text.size(15).gray600.make(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
