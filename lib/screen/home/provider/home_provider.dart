import 'package:flutter/material.dart';
import 'package:product_api/utils/api_helper.dart';


class ProductProvider extends ChangeNotifier
{

  List<dynamic> l1 = [];
  Future<void> ProductApiCall()
  async {
    productHelper p1 = productHelper();


    List<dynamic> ApiCall= await p1.ApiCall();
    l1 = ApiCall;
    notifyListeners();

  }
}