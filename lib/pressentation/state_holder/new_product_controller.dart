import 'package:ecom_ostad/data/models/product_model.dart';
import 'package:ecom_ostad/data/services/network_caller.dart';
import 'package:ecom_ostad/data/services/network_response.dart';
import 'package:get/get.dart';

import '../../data/utillity/urls.dart';

class NewProductController extends GetxController{
  bool _getNewProductInProgress = false;
  ProductModel _newProductModel = ProductModel();
  String _errorMessege = '';

  bool get getNewProductInProgress => _getNewProductInProgress;
  ProductModel get newProductModel => _newProductModel;
  String get errorMessge => _errorMessege;

  Future<bool> getNewProducts()async{
    _getNewProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductByRemarks('new'));
    _getNewProductInProgress = false;
    if(response.isSuccess){
      _newProductModel = ProductModel.fromJson(response.responsejson ?? {});
      update();
      return true;
    }else{
      _errorMessege = 'New data not match';
      update();
      return false;
    }
  }
}

// class ProductController extends GetxController{
//   bool _getPopPularProductInProgress = false;
//   bool _getSpecialProductInProgress = false;
//   bool _getNewProductInProgress = false;
//   ProductModel _popularProductModel = ProductModel();
//   ProductModel _newProductModel = ProductModel();
//   ProductModel _specialProductModel = ProductModel();
//   String _errorMessege = '';
//
//   bool get getPopularProductInProgress => _getPopPularProductInProgress;
//   ProductModel get popularProductModel => _popularProductModel;
//   String get errorMessge => _errorMessege;
//
//   Future<bool> getProductsByRemarks(String remarks)async{
//     if(remarks == 'popular'){
//       _getPopPularProductInProgress = true;
//     }else if(remarks == 'new'){
//       _getNewProductInProgress = true;
//     }else{
//       _getSpecialProductInProgress = true;
//     }
//     update();
//     late String url;
//     if(remarks == 'popular'){
//       url = Urls.getProductByRemarks('popular');
//     }else if(remarks == 'new'){
//       url = Urls.getProductByRemarks('new');
//     }else{
//       url = Urls.getProductByRemarks('special');
//     }
//     final NetworkResponse response = await NetworkCaller().getRequest(url);
//     if(remarks == 'popular'){
//       _getPopPularProductInProgress = false;
//     }else if(remarks == 'new'){
//       _getNewProductInProgress = false;
//     }else{
//       _getSpecialProductInProgress = false;
//     }
//     if(response.isSuccess){
//       if(remarks == 'popular'){
//         _popularProductModel = ProductModel.fromJson(response.responsejson ?? {});
//       }else if(remarks == 'new'){
//         _newProductModel = ProductModel.fromJson(response.responsejson ?? {});
//       }else{
//         _specialProductModel = ProductModel.fromJson(response.responsejson ?? {});
//       }
//       update();
//       return true;
//     }else{
//       _errorMessege = 'Popular data not match';
//       update();
//       return false;
//     }
//   }
// }