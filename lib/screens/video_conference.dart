import 'package:flutter/material.dart';
import 'package:zoom_video/variables.dart';
import 'package:zoom_video/video_call/create_meeting.dart';
import 'package:zoom_video/video_call/joinmeeting.dart';
class VideoConference extends StatefulWidget {
  const VideoConference({ Key? key }) : super(key: key);

  @override
  _VideoConferenceState createState() => _VideoConferenceState();
}

class _VideoConferenceState extends State<VideoConference> with SingleTickerProviderStateMixin
{ TabController? tabController;
   buildTabs(String name)
   {
     return Container(
       height: 60,
       width: 150,
       child: Card(
         child: Center(
           child: Text(name,style: myStyle(15,Colors.black,FontWeight.w700),),
         ),
       ),
     );
   }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2,vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("zoom", style: myStyle(20,Colors.white,FontWeight.w700),
       ),
       centerTitle: true,
       backgroundColor: Colors.blue,
       bottom: TabBar(
         controller: tabController,
         tabs: [
           buildTabs("Join Meeting"),
           buildTabs("Create Meeting"),
         ],
         ),
     ),   
     body: TabBarView(
       controller: tabController,
       children: [
         JoinMeeting(),
         CreateMeeting(),
       ],),   
    );
  }
}