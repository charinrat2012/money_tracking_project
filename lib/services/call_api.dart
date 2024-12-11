import 'dart:convert';

import 'package:money_tracking_project/models/money.dart';
import 'package:money_tracking_project/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:money_tracking_project/utils/env.dart';

class CallAPI {
//Method call checkPassAPI.php -------------------------------------
  static Future<User> callcheckPassAPI(User user) async {
    //call to use API and then store the values received from the API in variables.
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/moneytrackingAPI/apis/checkPassAPI.php'), // api url
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
    if (responseData.statusCode == 200) {
      return User.fromJson(jsonDecode(responseData.body));
    } else {
      throw Exception('Failed to call API');
    }
  }

//Method call newUserAPI.php (add new user profile)-------------------------------------
  static Future<User> callregisterAPI(User user) async {
    //call to use API and then store the values received from the API in variables.
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/moneytrackingAPI/apis/registerAPI.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
    if (responseData.statusCode == 200) {
      return User.fromJson(jsonDecode(responseData.body));
    } else {
      throw Exception('Failed to call API');
    }
  }

  //Method call getAllMoneyByuserId.php (get all data)-------------------------------------
  static Future<List<Money>> callgetAllMoneyByuserId(Money trip) async {
    //call to use API and then store the values received from the API in variables.
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/moneytrackingAPI/apis/getAllMoneyByuserId.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(trip.toJson()),
    );
    if (responseData.statusCode == 200) {
     final dataList = await jsonDecode(responseData.body).map<Money>((json){
       return Money.fromJson(json);
     }).toList();

     return dataList;
    } else {
      throw Exception('Failed to call API');
    }
  }


  //Method call insertInOutComeAPI.php (add new in/outcome)-------------------------------------
  static Future<Money> callinsertInOutComeAPI(Money trip) async {
    //call to use API and then store the values received from the API in variables.
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/moneytrackingAPI/apis/insertInOutComeAPI.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(trip.toJson()),
    );
    if (responseData.statusCode == 200) {
      return Money.fromJson(jsonDecode(responseData.body));
    } else {
      throw Exception('Failed to call API');
    }
  }

}