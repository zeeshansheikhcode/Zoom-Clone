import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:zoom_video/variables.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = '';
  bool dataisthere = false;
  TextEditingController usernamecontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }
  EditProfile() async
  {
    usercollection.doc(FirebaseAuth.instance.currentUser!.uid).update({
    'username': usernamecontroller.text,
    });
    setState(() {
      username= usernamecontroller.text;
    });
    Navigator.pop(context);
  }
  getuserdata() async
  {
    DocumentSnapshot userdoc = await  usercollection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      username  = userdoc['username'];
      dataisthere= true;
    });
  }
  EditProfileDialog() async
  {
    return showDialog(
      context: context,
      builder: (context){
        return Dialog(
          child: Container(
            height: 200,
            child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  margin: const EdgeInsets.only(left: 30,right: 30),
                  child: TextField(
                    controller: usernamecontroller,
                    style: myStyle(18,Colors.black),
                    decoration: InputDecoration(
                      labelText: "Update Username",
                      labelStyle: myStyle(16,Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                InkWell(
                onTap: ()=>EditProfile(),
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 40,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: GradientColors.cherry),
                  ),
                  child: Center(
                    child: Text("Update Now",
                    style: myStyle(17,Colors.white),),
                  ),
                ),
              ),

              ],

            ),
          ),
        );
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body:dataisthere == false ?
    const  Center(
        child: CircularProgressIndicator(),
      )
      : Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2.5,
              decoration:const BoxDecoration(
                gradient: LinearGradient(colors: GradientColors.facebookMessenger)
              ),
            ),
          ),
          Container(
            margin:  EdgeInsets.only(
              left: MediaQuery.of(context).size.width/2-64,
              right: MediaQuery.of(context).size.height/3.1,),
              child:const CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage('images/profile.jpg'),
                //NetworkImage('https://www.google.com/search?q=profile+pictures+with+ending+address+png&tbm=isch&chips=q:profile+pictures+with+ending+address+png,online_chips:icon:O1QCd44eMxk%3D&hl=en&sa=X&ved=2ahUKEwjZqIa275X1AhXM0YUKHcX8CwcQ4lYoAHoECAEQEQ&biw=1349&bih=629#imgrc=oXlyOuq8MWMJnM'),

            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
              const   SizedBox(height: 300,),
                Text(username,
                style: myStyle(40,Colors.black),
                textAlign: TextAlign.center,
                ),
              const  SizedBox(height: 30,),
              InkWell(
                onTap: ()=>EditProfileDialog(),
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 40,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: GradientColors.cherry),
                  ),
                  child: Center(
                    child: Text("Edit Profile",
                    style: myStyle(17,Colors.white),),
                  ),
                ),
              ),

              ],
            ),
          )
        ],
      ),
      
    );
  }
}