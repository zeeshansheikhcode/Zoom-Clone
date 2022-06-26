//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_video/screens/homepage.dart';
import 'package:zoom_video/screens/introtoauth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    );
  }
}
class NavigationPage extends StatefulWidget {
  const NavigationPage({ Key? key }) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned = false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   FirebaseAuth.instance.authStateChanges().listen((user){
  //     if(user!=null)
  //     {
  //       setState(() {
  //         isSigned=true;
  //       });
       
  //     }
  //     else
  //     {
  //       setState(() {
  //        isSigned=false;
  //       });
  //     }
  //    });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: isSigned == false ? const  IntroToAuth() :const HomePage() ,
      
    );
  }
}
