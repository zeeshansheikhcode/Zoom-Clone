import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:zoom_video/Authenticate/methods.dart';
import 'package:zoom_video/screens/homepage.dart';

import '../variables.dart';
 class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   TextEditingController emailcontroller    = TextEditingController();
   TextEditingController passwordcontroller = TextEditingController();
   TextEditingController usernamecontroller = TextEditingController();
       FirebaseAuth auth = FirebaseAuth.instance;
        FirebaseFirestore  firestore = FirebaseFirestore.instance;

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
               const SizedBox(height: 50,),
               Container(
                 width: MediaQuery.of(context).size.width/1.7,
                 child: TextField(
                   style: myStyle(18,Colors.black),
                   keyboardType: TextInputType.emailAddress,
                   controller: emailcontroller,
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
                   keyboardType: TextInputType.emailAddress,
                   controller: passwordcontroller,
                   decoration: InputDecoration(
                     hintText: 'Password',
                     prefixIcon: const Icon(Icons.lock),
                     hintStyle: myStyle(20,Colors.grey,FontWeight.w700), 
                   ),
                 ),
               ),
                const SizedBox(height: 20,),
               Container(
                 width: MediaQuery.of(context).size.width/1.7,
                 child: TextField(
                   style: myStyle(18,Colors.black),
                   keyboardType: TextInputType.emailAddress,
                   controller: usernamecontroller,
                   decoration: InputDecoration(
                     hintText: 'Username',
                     prefixIcon: const Icon(Icons.person),
                     hintStyle: myStyle(20,Colors.grey,FontWeight.w700), 
                   ),
                 ),
               ),
                 const SizedBox(height: 40,),
                 InkWell(
                   onTap: (){
                   try
                   {
                       createAccount(usernamecontroller.text,
                       emailcontroller.text,passwordcontroller.text)
                      .then((user)
                    {
                      if (user!=null)
                      {  
                      Navigator.push(context,MaterialPageRoute(builder:(_)=> HomePage()));
                       } 
                     });
                   }
                      catch(e)
                      {
                      print(e);
                      var snackbar = SnackBar(content: 
                      Text(
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
                       gradient: const  LinearGradient(
                         colors: GradientColors.seaBlue,
                         ),
                         borderRadius: BorderRadius.circular(20),
                     ),
                     child: Center(
                       child: Text("SIGN UP",
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

Future<User?> createAccount(String name,String email,String password) async
{    
        FirebaseAuth auth = FirebaseAuth.instance;
        FirebaseFirestore  firestore = FirebaseFirestore.instance;
    try
     {  User? user  = (await auth.createUserWithEmailAndPassword(email: email, password: password)).user;
        if(user!=null)
        {
          print('Account Created successfully');
          user.updateProfile(displayName: name);

          await firestore.collection('users').doc(auth.currentUser!.uid).set(
            {
                          'username' :   name,
                           'password':    password,
                           'email'   :    email,
            });
              return user;
        }
        else
        {
          print('Account creation Failed');
          return user;
        }
       

     }
     catch(e)
     {
        print(e);
        return null;

     }

}
//  return user;
                      
                 //else
        //          {
        //   print('Account creation Failed');
        //  // return user;
        // }

                      //  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      //  email: emailcontroller.text, password: passwordcontroller.text).
                      //  then((signeduser){
                      //  usercollection.doc(signeduser.user!.uid).set(
                      //     {
                      //      'username' :   usernamecontroller,
                      //      'password':    passwordcontroller,
                      //      'email'   :    emailcontroller,
                      //   //  usercollection.doc(signeduser.user!.uid).set({
                      //   //    'username': usernamecontroller,
                      //   //    'password': passwordcontroller,
                      //   //    'email': emailcontroller,
                      //   //  });
                      //  });
                      //    Navigator.pop(context);
                      // });