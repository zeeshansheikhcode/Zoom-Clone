import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:zoom_video/Authenticate/Methods.dart';
import 'package:zoom_video/screens/homepage.dart';
import 'package:zoom_video/variables.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   TextEditingController emailcontroller    = TextEditingController();
   TextEditingController passwordcontroller = TextEditingController();

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
           decoration: const BoxDecoration(
             gradient: LinearGradient(
               colors: GradientColors.blue
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
               const SizedBox(height: 50,),
               Container(
                 width: MediaQuery.of(context).size.width/1.7,
                 child: TextField(
                   style: myStyle(18,Colors.black),
                   controller: emailcontroller,
                   keyboardType: TextInputType.emailAddress,
                   decoration: InputDecoration(
                     hintText: 'Email',
                     prefixIcon: const Icon(Icons.email),
                     hintStyle: myStyle(20,Colors.grey,FontWeight.w700), 
                   ),
                 ),
               ),
              const SizedBox(height: 20,),
               Container(
                 width: MediaQuery.of(context).size.width/1.7,
                 child: TextField(
                   style: myStyle(18,Colors.black),
                   controller: passwordcontroller,
                   keyboardType: TextInputType.emailAddress,
                   decoration: InputDecoration(
                     hintText: 'Password',
                     prefixIcon: const Icon(Icons.lock),
                     hintStyle: myStyle(20,Colors.grey,FontWeight.w700), 
                   ),
                 ),
               ),
               const SizedBox(height: 40,),
                InkWell(
                   onTap: ()
                    {
                      try
                      {
                      //    logIn(emailcontroller.text ,passwordcontroller.text).then((user)
                      //  { if(user!=null)
                      //  {
                    //  print('Login Successful');
                    //  setState((){
                    //   isLoading = false;
                    //  });
                  //    Navigator.push(context,MaterialPageRoute(builder: (_) => HomePage()));
                  //  }
                        int count=0;
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailcontroller.text, 
                        password: passwordcontroller.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                      //   // Navigator.popUntil(context, (route){
                      //   //   return count++ == 2;
                      //  // });
                      }
                      
                      catch(e)
                      {
                       print(e);
                       var snackbar = SnackBar(content: Text(
                        e.toString(), 
                        style: myStyle(20),
                       ));
                       Scaffold.of(context).showSnackBar(snackbar);
                      }
                     
                    },
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
                       style: myStyle(25,Colors.white),
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

// Future<User?> logIn(String email,String password) async
// {  FirebaseFirestore firestore = FirebaseFirestore.instance;
//    FirebaseAuth auth = FirebaseAuth.instance;
//    try
//    { User? user = (await auth.signInWithEmailAndPassword(email: email, password: password)).user;
     
     
//      if(user!=null)
//      { 
//        print('Login Successful');
//        await 
//        firestore
//       .collection('users')
//       .doc(auth.currentUser!.uid)
//       .get();
//      // .then((value) => user.updateProfile(displayName: value['name']));
//        return user;
//      }
//      else
//      {
//        print('Login Feiled');
//        return user;
//      }
    
//    }
//    catch(e)
//    {
//      print(e);
//      return null;
//    }

// }