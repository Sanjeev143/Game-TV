import 'package:flutter/material.dart';
import 'package:game_tv/model/PrefModel.dart';
import 'package:game_tv/provider/home_provider.dart';
import 'package:game_tv/provider/login_provider.dart';
import 'package:game_tv/ui/home.dart';
import 'package:game_tv/ui/login.dart';
import 'package:game_tv/utils/AppPref.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppPref.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: LoginProvider()),
        ChangeNotifierProvider.value(value: HomeProvider()),
      ],
      child: MaterialApp(
          title: 'BlueStack Assessment',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          initialRoute: checkUser(context),
          routes: {
            '/login': (context) => Login(),
            '/home': (context) => HomePage(),
          }
      ),
    );
  }

  String checkUser(BuildContext context) {
    PrefModel prefModel = AppPref.getPref();
    if (prefModel != null && prefModel.isLogin != null && prefModel.isLogin) {
      return '/home';
    } else {
      return '/login';
    }
  }
}