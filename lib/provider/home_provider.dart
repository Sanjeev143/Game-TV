// Created by Sanjeev Sangral on 19/09/21.
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_tv/model/api_response.dart';
import 'package:game_tv/utils/final_vals.dart';
import 'package:game_tv/utils/view_utils.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier{
  APIResponse apiResponse;
  void tvListApiCall(BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey) async{
    var response = await http.get(Uri.parse(Strings.url));
    print(response);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      apiResponse =  APIResponse.fromJson(jsonDecode(response.body));
      notifyListeners();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      ViewUtil.showSnackBar(_scaffoldKey, Strings.apiResponseError+" ${response.statusCode}",Colors.red);
      throw Exception('Failed to load album');
    }
  }

}