import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_api/screen/home/model/home_model.dart';


class productHelper
{

  Future<List> ApiCall()
  async {
    String? link = "https://fakestoreapi.com/products";
    List<dynamic> l1 = [];

    Uri uri = Uri.parse(link);

    var response = await http.get(uri);

    var json = jsonDecode(response.body);
    // print(response.body);
    List<dynamic> ProductList = json.map((e) => ProductModel().ProductFromJson(e)).toList();
    l1 = ProductList;

    return l1;

  }
}