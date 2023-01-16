import 'package:flipr/controller/controllers_export.dart';
import 'package:flipr/utilities/utilities_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);

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
                  AppStrings.signUpString,
                  style: TextStyle(color: Colors.black, fontSize: 28),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: controller.nameController,
                  validator: (value) {
                    if (value != null &&
                        value.trim() != "" &&
                        value.length >= 3) {
                      //Entered value shouldn't be null
                      //As well as should be equal to empty spaces.
                      return null;
                    } else {
                      return AppStrings.emailEnterText;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: AppStrings.nameHintText,
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(8.0)),
                    focusedBorder: OutlineInputBorder(
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
                  ),
                ),
              ),
              SizedBox(
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
                    focusedBorder: OutlineInputBorder(
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
                    controller: controller.passwordController1,
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
                    obscureText: controller.obscureText1.value,
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
                              controller.obscureText1.value =
                                  !controller.obscureText1.value;
                            },
                            icon: Icon(
                              controller.obscureText1.value
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(
                  () => TextFormField(
                    controller: controller.passwordController2,
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
                    obscureText: controller.obscureText2.value,
                    decoration: InputDecoration(
                      hintText: AppStrings.reEnterPasswordHintText,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                        size: 24,
                      ),
                      suffixIcon: Obx(
                        () => IconButton(
                            onPressed: () {
                              controller.obscureText2.value =
                                  !controller.obscureText2.value;
                            },
                            icon: Icon(
                              controller.obscureText2.value
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
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.formKey.currentState?.save();
                      controller.signUpUser(
                          controller.nameController.text,
                          controller.emailController.text,
                          controller.passwordController1.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(200, 30),
                      padding: const EdgeInsets.all(10)),
                  child: const Text(
                    AppStrings.signUpInApp,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
