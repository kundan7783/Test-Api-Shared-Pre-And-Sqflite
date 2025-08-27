import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_api_shared_sqflite/models/carts_model.dart';
class ApiService {
  static Future<List<CartsModel>?> getAllCartsFromApi() async {
     try{
       var response=  await http.get(Uri.parse("https://fakestoreapi.com/carts"));
       if(response.statusCode == 200){
         var responseBody= response.body;
         List<dynamic> responseJson=jsonDecode(responseBody);
         return responseJson.map((e) => CartsModel.fromJson(e),).toList();
       }else{
         print(" Status Code ${response.statusCode}");
       }
     }catch(e){
       print(e);
     }
    return null;
  }
}