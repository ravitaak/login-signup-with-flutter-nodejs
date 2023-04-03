import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/dashboard.dart';
import 'package:login_signup/utils/helper.dart';

import 'homepage.dart';

void main() {
  runApp(const GetMaterialApp(
      debugShowCheckedModeBanner: false, home: MainPage()));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    userProfileAvailble().then((value) async => {
          Timer(const Duration(seconds: 2), () {
            if (value) {
              Get.to(() => const DashboardPage());
            } else {
              Get.to(() => const HomePage());
            }
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Welcome Back", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          const Text("Nce to see you again!", style: TextStyle(fontSize: 18)),
          SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: const Image(
                colorBlendMode: BlendMode.overlay,
                image: AssetImage('assets/background.png'),
              )),
          const Text("Loading...", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          const CircularProgressIndicator(color: Colors.black),
        ],
      )),
    );
  }
}
