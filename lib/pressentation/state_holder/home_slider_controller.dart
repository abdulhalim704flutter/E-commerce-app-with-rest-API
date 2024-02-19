import 'package:ecom_ostad/data/models/slider_model.dart';
import 'package:ecom_ostad/data/services/network_caller.dart';
import 'package:ecom_ostad/data/services/network_response.dart';
import 'package:get/get.dart';

import '../../data/utillity/urls.dart';

class HomeSliderController extends GetxController {
  bool _getHomeSliderInProgress = false;
  String _massege = '';

  SliderModel _sliderModel = SliderModel();

  bool get getHomeSliderInProgress => _getHomeSliderInProgress;
  String get massege => _massege;
  SliderModel get sliderModel => _sliderModel;

  Future<bool> getHomeSlider() async {
    _getHomeSliderInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getHomeSliders);
    _getHomeSliderInProgress = false;
    if(response.isSuccess){
      _sliderModel = SliderModel.fromJson(response.responsejson ?? {});
      update();
      return true;
    }else{
      update();
      return false;

    }
  }
}
