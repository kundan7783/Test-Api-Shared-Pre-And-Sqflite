import 'package:flutter/cupertino.dart';
import 'package:test_api_shared_sqflite/models/carts_model.dart';
import 'package:test_api_shared_sqflite/services/api_service.dart';

class CartsApiProvider with ChangeNotifier {
  List<CartsModel> cartsData=[];

  bool isLoading=false;

  getDataFromApi() async {
    isLoading=true;
    notifyListeners();

    var response = await ApiService.getAllCartsFromApi();
    if(response != null){
      cartsData.clear();
      cartsData.addAll(response);
    }

    isLoading=false;
    notifyListeners();
  }

}