import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:login_signup/utils/helper.dart';

import 'homepage.dart';
import 'login.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var cPassController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => const HomePage());
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Sign up",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: const Image(
                      colorBlendMode: BlendMode.overlay,
                      image: AssetImage('assets/background.png'),
                    ),
                  ),
                  const Text(
                    "Create an account, It's free",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  makeInput(label: "Email", controller: emailController),
                  makeInput(
                      label: "Password",
                      obscureText: true,
                      controller: passController),
                  makeInput(
                      label: "Confirm Password",
                      obscureText: true,
                      controller: cPassController),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    singupUser(
                        emailController, passController, cPassController);
                  },
                  color: const Color.fromRGBO(107, 99, 255, 1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const LoginPage());
                      },
                      child: const Text(
                        " Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromRGBO(107, 99, 255, 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false, required controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  void singupUser(emailController, passController, cPassController) {
    registerUser(emailController.text.trim(), passController.text.trim(),
            cPassController.text.trim())
        .then((value) => {
              if (value)
                {
                  emailController.clear(),
                  passController.clear(),
                  cPassController.clear(),
                  Get.off(() => const LoginPage())
                }
            });
  }
}
