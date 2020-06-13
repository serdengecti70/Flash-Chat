import 'package:flash_chat/components/roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: "logo",
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 500),
                  text: ['Flash Chat', 'Flash Chat'],
                  textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(
              color: Colors.lightBlueAccent,
              onpressed: () {
                Navigator.pushNamed(context, "/login");
              },
              text: "Log In",
            ),
            RoundButton(
              color: Colors.blue,
              onpressed: () {
                Navigator.pushNamed(context, "/register");
              },
              text: "Register",
            ),
          ],
        ),
      ),
    );
  }
}
