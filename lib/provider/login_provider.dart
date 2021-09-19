// Created by Sanjeev Sangral on 19/09/21.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_tv/model/PrefModel.dart';
import 'package:game_tv/model/login_request.dart';
import 'package:game_tv/utils/AppPref.dart';
import 'package:game_tv/utils/final_vals.dart';
import 'package:game_tv/utils/view_utils.dart';

class LoginProvider extends ChangeNotifier{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showProgress = false;
  void callLoginApi(BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey) async {
    showProgressUi();
    FocusScope.of(context).requestFocus(new FocusNode());
    LoginRequestPost postLogin = new LoginRequestPost();
    postLogin.email = emailController.text.trim();
    postLogin.password = passwordController.text.trim();
    if (!ViewUtil.checkStringIsEmpty(postLogin.email)) {
      hideProgressUi();
      ViewUtil.showSnackBar(_scaffoldKey, Strings.emailErrorMessage,Colors.red);
      return;
    } else if (!ViewUtil.checkEmailValid(postLogin.email)) {
      hideProgressUi();
      ViewUtil.showSnackBar(_scaffoldKey, Strings.validEmailErrorMessage,Colors.red);
      return;
    } else if (!ViewUtil.checkStringIsEmpty(postLogin.password)) {
      hideProgressUi();
      ViewUtil.showSnackBar(_scaffoldKey, Strings.emptyPasswordErrorMessage,Colors.red);
      return;
    }else if (!ViewUtil.checkStringIsLessThenThree(postLogin.password)) {
      hideProgressUi();
      ViewUtil.showSnackBar(_scaffoldKey, Strings.passwordLengthErrorMessage,Colors.red);
      return;
    } else {
      //----call api here----//
      if(emailController.text.trim() == 'er.sanjeevsangral@gmail.com' && passwordController.text.trim() == 'qwertyui123'){
        Future.delayed(Duration(seconds: 3),(){
          PrefModel prefModel = AppPref.getPref();
          prefModel.isLogin = true;
          prefModel.userEmail = emailController.text.trim();
          AppPref.setPref(prefModel);
          hideProgressUi();
          openHomeScreen(context);
        });
      }else{
        Future.delayed(Duration(seconds: 3),(){
          hideProgressUi();
          ViewUtil.showSnackBar(_scaffoldKey, Strings.loginErrorMessage, Colors.red);
        });

      }

    }
  }

  openHomeScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/home', (Route<dynamic> route) => false);
    notifyListeners();
  }

  // void showSnackBar(GlobalKey<ScaffoldState> _scaffoldKey, String msg, Color color) {
  //   ViewUtil.showSnackBar(_scaffoldKey, msg,color);
  // }

  void showProgressUi() {
    showProgress = true;
    notifyListeners();
  }

  void hideProgressUi() {
    showProgress = false;
    notifyListeners();
  }
}