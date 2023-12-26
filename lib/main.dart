import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:take_n_go/screens/customer_profile.dart';
import 'package:take_n_go/screens/delivery_request.dart';
import 'package:take_n_go/screens/freelance_profile.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:take_n_go/screens/home.dart';
import 'package:take_n_go/screens/login_page.dart';
import 'package:take_n_go/screens/my_deliveries.dart';
import 'package:take_n_go/screens/org_profile.dart';
import 'package:take_n_go/widgets/phone.dart';
import 'package:take_n_go/screens/verify.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
      routes: {
      'login':(context) => LoginPage(),
      'phone': (context) => const MyPhone(),
      'verify': (context) => const MyVerify(),
      'home': (context) => const HomePage(),
      'customer': (context) => CustomerProfile(),
      'org': (context) => OrgProfile(),
      'freelance': (context) => FreelanceProfile(),
      'request' : (context) => DeliveryRequest(),
      'my' :(context) => MyDeliveries(),
    },
    );
  }
}