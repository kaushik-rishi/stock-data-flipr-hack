import 'package:flipr/bindings/bindings_export.dart';
import 'package:flipr/controller/controllers_export.dart';
import 'package:flipr/utilities/utilities_export.dart';
import 'package:flipr/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Stock Market",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  AppStrings.welcomeToApp,
                  style: TextStyle(color: Colors.black, fontSize: 28),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  AppStrings.loginString,
                  style: TextStyle(color: Colors.black, fontSize: 28),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: controller.emailController,
                  validator: (value) {
                    if (value != null && value.trim() != "") {
                      //Entered value shouldn't be null
                      //As well as should be equal to empty spaces.
                      return Validators.validateEmailId(value);
                    } else {
                      return AppStrings.emailEnterText;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: AppStrings.emailHintText,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(8.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(8.0)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.grey, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(8.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(
                  () => TextFormField(
                    controller: controller.passwordController,
                    validator: (value) {
                      if (value != null && value.trim() != "") {
                        //Entered value shouldn't be null
                        //As well as should be equal to empty spaces.
                        return Validators.validatePassword(value);
                      } else {
                        return AppStrings.enterPassword;
                      }
                    },
                    keyboardType: TextInputType.text,
                    obscureText: controller.obscureText.value,
                    decoration: InputDecoration(
                      hintText: AppStrings.passwordHintText,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                        size: 24,
                      ),
                      suffixIcon: Obx(
                        () => IconButton(
                            onPressed: () {
                              controller.obscureText.value =
                                  !controller.obscureText.value;
                            },
                            icon: Icon(
                              controller.obscureText.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            )),
                      ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(8.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(8.0)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.grey, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(8.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      controller.formKey.currentState!.save();
                      await controller.loginApp(controller.emailController.text,
                          controller.passwordController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(200, 30),
                      padding: const EdgeInsets.all(10)),
                  child: const Text(
                    AppStrings.loginInApp,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )),
              SizedBox(
                height: 50,
              ),
              Text(
                "Don't Have Account?",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(SignUpPage(), binding: SignUpBinding());
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(200, 30),
                      padding: const EdgeInsets.all(10)),
                  child: Text(
                    "SignUp",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
