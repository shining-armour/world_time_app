import 'package:http/http.dart';
import 'dart:convert'; // To convert/decode json string to a Map object
import 'package:intl/intl.dart';

class WorldTime{
  String location;   // location name for the UI.
  String time;       // time in that location
  String flag;       // url to an asset flag icon.
  String url;        // unique location url for api endpoint.
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  // Asynch code example
  Future<void> getTime() async{

    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime = data['datetime'];
      String hours = data['utc_offset'].substring(1,3);
      String minutes = data['utc_offset'].substring(4,6);
      String gmtsign = data['utc_offset'][0];
      //print(datetime);

      DateTime now = DateTime.parse(datetime);
      //print(now);
      if (gmtsign=='+')
      now = now.add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
      else
      now = now.subtract(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
      //print(now);

      // Ternary operator
      isDayTime = now.hour > 5 && now.hour < 20 ? true : false ;
      // set the time property
      time = DateFormat.jm().format(now);
  }
  catch(e){
      print("caught an exception: $e");
      time="Couldn't get valid time for this location :(";
  }

  }

}

