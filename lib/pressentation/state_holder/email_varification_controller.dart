import 'package:ecom_ostad/data/services/network_caller.dart';
import 'package:ecom_ostad/data/services/network_response.dart';
import 'package:get/get.dart';

import '../../data/utillity/urls.dart';

class EmailVeficationController extends GetxController {
  bool _emailVerificationInProgress = false;
  String _massege = '';

  bool get emailVerifictaionInProgress => _emailVerificationInProgress;
  String get massege => _massege;

  Future<bool> verifyEmail(String email) async {
    _emailVerificationInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.verifyEmail(email));
    _emailVerificationInProgress = false;
    update();
    if(response.isSuccess){
      _massege = response.responsejson?['data'] ?? '';
      return true;

    }else{
      return false;

    }
  }
}
