import 'package:ecom_ostad/data/services/network_caller.dart';
import 'package:ecom_ostad/data/services/network_response.dart';
import 'package:ecom_ostad/pressentation/state_holder/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/utillity/urls.dart';

class OTPVeficationController extends GetxController {
  bool _otpVerificationInProgress = false;
  String _massege = '';

  bool get otpVerifictaionInProgress => _otpVerificationInProgress;
  String get massege => _massege;

  Future<bool> verifyOTP(String email, String otp) async {
    _otpVerificationInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.verifyOTP(email, otp));
    _otpVerificationInProgress = false;
    update();
    if (response.isSuccess) {
      // this line is for save token
      await AuthController.setAccessToken(response.responsejson?['data']);
      return true;
    } else {
      return false;
    }
  }
}
