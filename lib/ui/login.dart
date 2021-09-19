// Created by Sanjeev Sangral on 19/09/21.
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_tv/provider/login_provider.dart';
import 'package:game_tv/utils/common_colors.dart';
import 'package:game_tv/utils/size_config.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfiguration().init(context);
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Login'),),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: SizeConfiguration.screenHeight * 0.1,),
          Image.asset('assets/images/gametv1.png',width: size.width * 0.7, height: 40.0,),
          _buildMargin(),
          _buildTextField(text: 'Email/Phone No',charLength: 30,controller: loginProvider.emailController,obscureTextVal: false, textInputAction: TextInputAction.next, textInputType: TextInputType.text),
          _buildMargin(),
          _buildTextField(text: 'Password',charLength: 30,controller: loginProvider.passwordController,obscureTextVal: true, textInputAction: TextInputAction.next, textInputType: TextInputType.text),
          _buildMargin(),
          _buildLoginButton(context,loginProvider, _scaffoldKey),
        ],
      ),
    );
  }

  Widget _buildMargin(){
    return SizedBox(height: SizeConfiguration.screenHeight * 0.02,);
  }

  Widget _buildLoginButton(BuildContext context,LoginProvider loginProvider,GlobalKey<ScaffoldState> _scaffoldKey){
    return Padding(
      padding: EdgeInsets.all(SizeConfiguration.heightMultiplier * 1.09),
      child: ElevatedButton(
          child: loginProvider.showProgress
              ? SpinKitThreeBounce(
            color: Colors.white,
            size: 20,
          ): Text(
              "Login",
              style: TextStyle(fontSize: 18)
          ),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(primary),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(color: primary)
                  )
              )
          ),
          onPressed: (){
            loginProvider.callLoginApi(context, _scaffoldKey);
          }
      ),
    );
  }

  Widget _buildTextField({
    String text,
    TextEditingController controller,
    TextInputAction textInputAction,
    bool obscureTextVal,
    TextInputType textInputType,
    int charLength}) {
    return new Container(
      padding: EdgeInsets.all(SizeConfiguration.heightMultiplier * 1.09),
      child: TextField(
        maxLength: charLength,
        keyboardType: textInputType,
        cursorColor: primary,
        textInputAction: textInputAction,
        controller: controller,
        obscureText: obscureTextVal,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderSide: BorderSide(color: primary, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            labelStyle: TextStyle(color: primary),
            labelText: text,
            hintText: '',
            counterText: ""),
      ),
    );
  }

}
