import 'package:flutter/material.dart';
import 'package:zoom_video/screens/profile.dart';
import 'package:zoom_video/screens/video_conference.dart';
import 'package:zoom_video/variables.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page =0;
  List pageoptions = [
    VideoConference(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: myStyle(17,Colors.blue),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: myStyle(17,Colors.black),
        currentIndex: page,
        onTap: (index){
          setState(() {
            page = index;
          });
        },
        items:const  [
          BottomNavigationBarItem(
            label: 'Video Call',
            icon: Icon(Icons.video_call,size: 32,)
            ),
         BottomNavigationBarItem(
             label: 'Person',
            icon: Icon(Icons.person,size: 32,)
            ),
        ]),
       body: pageoptions[page],
    );
  }
}