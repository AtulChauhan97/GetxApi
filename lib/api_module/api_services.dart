
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../product_module/models/product_model.dart';

class ApiService{

static final dio = Dio();
static var url = "https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie";

static Future<List<Product>>  productData()async{

  Response response = await dio.get(url);
  if(response.statusCode==200){
    debugPrint("response ${response}");
    var res = response.data as List;
    return res.map((e) => Product.fromJson(e)).toList();
  }else{
    return [];
  }


}


}