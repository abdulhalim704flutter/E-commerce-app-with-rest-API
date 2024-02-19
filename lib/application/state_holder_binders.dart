import 'package:ecom_ostad/pressentation/state_holder/category_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/email_varification_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/home_slider_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/otp_varification_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/popular_product_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/product_details_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/speacial_product_controller.dart';
import 'package:get/get.dart';

import '../pressentation/state_holder/main_bottom_nav_controller.dart';
import '../pressentation/state_holder/new_product_controller.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVeficationController());
    Get.put(OTPVeficationController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(NewProductController());
    Get.put(SpecialProductController());
    Get.put(ProductDetailsController());
  }
}