import 'dart:async';

import 'package:covidtrackerapp/View/world_stats.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {


  late final AnimationController _controller = AnimationController(
      vsync: this, duration: Duration(seconds: 3))
    ..repeat();

  @override
  void initState() {
    // TODO: implement initState
      Timer(
        Duration(seconds: 4),
        () => Navigator.push(context, MaterialPageRoute(builder: (_)=>WorldStats())),
      );
    super.initState();
  }
  void dispose(){
    _controller.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller, builder: (context, Widget?child) {
              return Center(
                child: Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: Image(image: AssetImage('images/virus.png'),width: 200,height: 200,),
                ),
              );
            }),
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.08,),
            Text('Covid-19\nTracking App', style: TextStyle(
               fontSize: 30, fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center,)

          ],
        ),
      ),
    );
  }
}
