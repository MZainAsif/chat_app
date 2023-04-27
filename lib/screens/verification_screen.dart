import 'package:chat_app/consts/colors.dart';
import 'package:chat_app/consts/strings.dart';
import 'package:chat_app/consts/utils.dart';
import 'package:chat_app/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: letsconnect.text.black.bold.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return "Please enter your username";
                        }
                        return null;
                      },
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Vx.gray600,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: bgColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Vx.gray600,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: bgColor,
                        ),
                        alignLabelWithHint: true,
                        labelText: 'User Name',
                        hintText: 'eg: John',
                        labelStyle: const TextStyle(
                          color: Vx.gray600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      //   keyboardType: TextInputType.number,
                    ),
                    11.heightBox,
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 9) {
                          return "Please enter your phone number";
                        }
                        return null;
                      },
                      controller: controller.phonenumberController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Vx.gray600,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: bgColor,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.phone_android_rounded,
                          color: bgColor,
                        ),
                        alignLabelWithHint: true,
                        labelText: 'Phone Number',
                        prefixStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        hintText: 'eg: 30********',
                        labelStyle: const TextStyle(
                          color: Vx.gray600,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: bgColor),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              13.heightBox,
              otp.text.semiBold.size(16).make(),
              Obx(
                () => Visibility(
                  visible: controller.isOtpSent.value,
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: 53,
                          child: TextField(
                            controller: controller.otpController[index],
                            cursorColor: Colors.black,
                            onChanged: (value) {
                              if (value.length == 1 && index <= 5) {
                                FocusScope.of(context).nextFocus();
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            cursorHeight: 20,
                            style: const TextStyle(
                              fontFamily: bold,
                              color: bgColor,
                            ),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: bgColor),
                              ),
                              hintText: "*",
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: context.screenWidth - 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bgColor,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        if (controller.isOtpSent.value == false) {
                          controller.isOtpSent.value = true;
                          await controller.sendOtp();
                        } else {
                          await controller.verifyOtp(context);
                        }
                      }
                    },
                    child: continueText.text.semiBold.size(16).make(),
                  ),
                ),
              ),
              30.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
