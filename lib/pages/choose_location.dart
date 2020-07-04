import 'package:flutter/material.dart';
import 'package:worldtimer/services/world_time.dart' ;

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locList = [
    WorldTime(url: 'Asia/Kabul', location: 'Kabul', flag: 'Afghanistan.png'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Buenos Aires', flag: 'Argentina.png'),
    WorldTime(url: 'Australia/Melbourne', location: 'Melbourne', flag: 'Australia.png'),
    WorldTime(url: 'Asia/Dhaka', location: 'Dhaka', flag: 'Bangladesh.png'),
    WorldTime(url: 'Asia/Thimphu', location: 'Thimphu', flag: 'Bhutan.png'),
    WorldTime(url: 'America/La_Paz', location: 'La Paz', flag: 'Bolivia.png'),
    WorldTime(url: 'America/Manaus', location: 'Manaus', flag: 'Brazil.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'Canada.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'China.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'Egypt.png'),
    WorldTime(url: 'Europe/Helsinki', location: 'Helsinki', flag: 'Finland.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'France.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'Germany.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'Greece.png'),
    WorldTime(url: 'Atlantic/Reykjavik', location: 'Reykjavik', flag: 'Iceland.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'India.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'Indonesia.png'),
    WorldTime(url: 'Asia/Tehran', location: 'Tehran', flag: 'Iran.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'Japan.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'Kenya.png'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico City', flag: 'Mexico.png'),
    WorldTime(url: 'Pacific/Auckland', location: 'Auckland', flag: 'New Zealand.png'),
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'Pakistan.png'),
    WorldTime(url: 'Asia/Manila', location: 'Manila', flag: 'Philippines.png'),
    WorldTime(url: 'Asia/Yekaterinburg', location: 'Yekaterinburg', flag: 'Russia.png'),
    WorldTime(url: 'Asia/Riyadh', location: 'Riyadh', flag: 'Saudi Arabia.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'South Korea.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'United Kingdom.png'),
    WorldTime(url: 'Europe/Kiev', location: 'Kiev', flag: 'Ukraine.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'United State of America.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locList[index];  // instance contain {url,location,flag} of current index
    await instance.getTime();
    // Navigate to home screen
    Navigator.pop(context, {
      'location':instance.location,
      'flag':instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });

  }

  // Asynch code example
  /*void getData() async{
    //simulate network request for a username
     String username = await Future.delayed(Duration(seconds: 3), () {
      return 'Yoshi';
    });

    //simulate network request to get bio of username
    String bio = await Future.delayed(Duration(seconds: 3), () {
      return 'Musician, Singer, Artist';
    });

    print('$username - $bio');
  }*/

  int counter=0;

  @override
  void initState() {
    super.initState();
    //print('initState ran');
    //getData();
    //print('This is printed without even waiting for getData to finish');
  }

  @override
  Widget build(BuildContext context) {
    //print('Build function widget');
    return Scaffold(
          appBar: AppBar(
            title: Text('Choose a Location'),
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
            elevation:0,
          ),
          body: ListView.builder(
            itemCount: locList.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title:Text(locList[index].location), //DOUBT!
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locList[index].flag}'),
                  ),
                ),
              );
          }
          ),

      /*RaisedButton(
        onPressed: (){
          setState(() {
            counter+=1;
          });
        },
        child: Text('Conter is $counter'),
      ),*/
      );
  }
}
