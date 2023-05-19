import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dsdmob/screens/Dashboard.dart';
import 'package:dsdmob/auth/register.dart';
import 'package:dsdmob/routes/routes.dart';
import 'package:dsdmob/auth/signup.dart';
import 'package:dsdmob/screens/getStarted.dart';

Future<void> main() async {
  //final token;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(token: prefs.getString("token"),));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({
    @required this.token,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: MySplashScreen(token: token),
      home: (token!=null && JwtDecoder.isExpired(token) == false)?Dashboard(token: token):getStarted(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      routes: {
        Routes.signup: (context) => const signup(),
        Routes.register: (context) => const register(),
      },
    );
  }
}
