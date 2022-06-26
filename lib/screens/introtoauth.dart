import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zoom_video/authentication/authentication_screen.dart';
import 'package:zoom_video/variables.dart';
class IntroToAuth extends StatefulWidget {
  const IntroToAuth({ Key? key }) : super(key: key);

  @override
  State<IntroToAuth> createState() => _IntroToAuthState();
}

class _IntroToAuthState extends State<IntroToAuth> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome',
          body:  'Welcome to the zoom the best video call app',
          image: Center(
            child: Image.asset('images/welcome.png',height: 175,),
          ),
          decoration: PageDecoration(
            titleTextStyle: myStyle(20,Colors.black),
            bodyTextStyle: myStyle(20,Colors.black),
          )
        ),
         PageViewModel(
          title: 'Join Or Start Meeting',
          body:  'Easy to use Interface,join or start meeting',
          image: Center(
            child: Image.asset('images/conference.png',height: 175,),
          ),
          decoration: PageDecoration(
            titleTextStyle: myStyle(20,Colors.black),
            bodyTextStyle: myStyle(20,Colors.black),
          )
        ),
         PageViewModel(
          title: 'Security',
          body:  'Your Security is our priority',
          image: Center(
            child: Image.asset('images/secure.jpg',height: 175,),
          ),
          decoration: PageDecoration(
            titleTextStyle: myStyle(20,Colors.black),
            bodyTextStyle: myStyle(20,Colors.black),
          )
        ),
      ],  
      onDone: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=> const AuthenticationScreen()));
      },
      
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),

     
    );
  }
}