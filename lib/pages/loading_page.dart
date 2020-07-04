import 'package:flutter/material.dart';
import 'package:worldtimer/services/world_time.dart' ;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime ins = WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
    await ins.getTime();
    //redirecting to home page after getting time
    Navigator.pushReplacementNamed(context, '/home', arguments:{
      'location':ins.location,
      'flag':ins.flag,
      'time': ins.time,
      'isDayTime': ins.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    //print('initState ran');
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
