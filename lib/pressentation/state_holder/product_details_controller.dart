import 'package:ecom_ostad/data/models/product_details.dart';
import 'package:ecom_ostad/data/models/product_details_model.dart';
import 'package:ecom_ostad/data/services/network_caller.dart';
import 'package:ecom_ostad/data/services/network_response.dart';
import 'package:ecom_ostad/data/utillity/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _getProductDetailsInProgress = false;
  ProductDetails _productDetails = ProductDetails();
  String _errorMsg = '';
  List<String> _availableColors = [];

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;
  ProductDetails get productDetails => _productDetails;
  String get errorMsg => _errorMsg;
  List<String> get availableColors => _availableColors;


  Future<bool> getProductDetails(int id) async {
    _getProductDetailsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getProductDetails(id));
    _getProductDetailsInProgress = false;
    if (response.isSuccess) {
      _productDetails =
          ProductDetailsModel.fromJson(response.responsejson ?? {}).data!.first;
      _convertStringToColor(productDetails.color ?? '');
      update();
      return true;
    } else {
      _errorMsg = 'Data has been faild!';
      update();
      return false;
    }
  }

  void _convertStringToColor(String color){
    final List<String> splitedColors = color.split(',');
    for(String c in splitedColors){
      if(c.isNotEmpty){
        _availableColors.add(c);
      }

    }
  }

}
