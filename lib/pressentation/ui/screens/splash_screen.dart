import 'package:ecom_ostad/pressentation/state_holder/auth_controller.dart';
import 'package:ecom_ostad/pressentation/ui/screens/auth/email_varification_screen.dart';
import 'package:ecom_ostad/pressentation/ui/screens/home_screen.dart';
import 'package:ecom_ostad/pressentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecom_ostad/pressentation/ui/utils/images_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoNextScreen();
  }

  void gotoNextScreen() async {
    await AuthController.gettAccessToken();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      //this line is for , checked is login or not login
      Get.offAll(()=> AuthController.isLoggedIn ? const MainBottomNavScreen() : const EmailVarificationScreen());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: SvgPicture.asset(
            ImageAssets.craftyBayLogoSvg,
            height: 100,
          )),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 16,
          ),
          const Text('Version 1.0.0'),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
