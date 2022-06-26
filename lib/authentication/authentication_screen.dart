import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:zoom_video/authentication/login_screen.dart';
import 'package:zoom_video/authentication/register_screen.dart';
import 'package:zoom_video/variables.dart';
class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({ Key? key }) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.grey[250],
     body: Stack(
       children: 
       [
         Container(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height/2,
           decoration:const BoxDecoration(
             gradient: LinearGradient(colors: GradientColors.blue
             ),
           ),
           child: Center(
             child: Image.asset('images/logo.png',height: 100,),
           ),
         ),
         Align(
           alignment: Alignment.bottomCenter,
           child: Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height/1.6,
             margin: const EdgeInsets.only(left: 30,right: 30),
             decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              color: Colors.white,
              borderRadius:const  BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              ),    
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: 
               [
                 InkWell(
                   onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const LoginScreen())),
                   child: Container(
                     width: MediaQuery.of(context).size.width/1.6,
                     height: 60,
                     decoration: BoxDecoration(
                       gradient: const LinearGradient(
                         colors: GradientColors.bigMango,
                         ),
                         borderRadius: BorderRadius.circular(20),
                     ),
                     child: Center(
                       child: Text("SIGN IN",
                       style: myStyle(30,Colors.white),
                       ),
                     ),
                   ),
                 ),
                 const SizedBox(height: 40,),
                 InkWell(
                    onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const RegisterScreen())),
                   child: Container(
                     width: MediaQuery.of(context).size.width/1.6,
                     height: 60,
                     decoration: BoxDecoration(
                       gradient: const LinearGradient(
                         colors: GradientColors.seaBlue,
                         ),
                         borderRadius: BorderRadius.circular(20),
                     ),
                     child: Center(
                       child: Text("SIGN UP",
                       style: myStyle(30,Colors.white),
                       ),
                     ),
                   ),
                 ),

               ],
             ),
           ),
         )
       ],
     ),
    );
  }
}