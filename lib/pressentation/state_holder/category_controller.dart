import 'dart:math';

import 'package:ecom_ostad/data/models/category_model.dart';
import 'package:ecom_ostad/data/models/slider_model.dart';
import 'package:ecom_ostad/data/services/network_caller.dart';
import 'package:ecom_ostad/data/services/network_response.dart';
import 'package:get/get.dart';

import '../../data/utillity/urls.dart';

class CategoryController extends GetxController {
  bool _getCategoriesInProgress = false;
  String _massege = '';

  CategoryModel _categoryModel = CategoryModel();

  bool get getCategoriesInProgress => _getCategoriesInProgress;
  String get massege => _massege;
  CategoryModel get categoryModel => _categoryModel;

  Future<bool> getCategories() async {
    _getCategoriesInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getCategories);
    print(response);
    _getCategoriesInProgress = false;
    if(response.isSuccess){
      _categoryModel = CategoryModel.fromJson(response.responsejson ?? {});
      update();
      return true;
    }else{
      update();
      return false;

    }
  }
}
