import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};

  @override
  Widget build(BuildContext context) {
    //if data is not empty return data=result else return data=home location(India)
    data = data.isNotEmpty==true ? data : ModalRoute.of(context).settings.arguments;

    // set background
    String bgImage =  data['isDayTime']==true ?'day.png':'night.png';
    // set color of notification bar
    Color bgColor = data['isDayTime']==true ? Colors.lightBlue : Colors.indigo[800];

    return Scaffold(
      backgroundColor: bgColor,
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit:BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 180.0, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location'); //DOUBT!
                    print(result);
                    setState(() {
                      data = {
                        'location':result['location'],
                        'time':result['time'],
                        'isDayTime':result['isDayTime'],
                        'flag':result['flag'],
                      };

                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                   color: Colors.grey[300],
                  ),
                  label: Text(
                      'Edit Location',
                        style: TextStyle(
                          fontFamily: 'DancingScript',
                          color:Colors.grey[300],
                          fontSize: 22.0,
                        )),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                   data['location'],
                   style: TextStyle(
                     fontFamily: 'DancingScript',
                     fontSize: 50.0,
                     letterSpacing: 3.0,
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                   ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 80.0,
                  color: Colors.white,
                )),
            ],
          ),
        ),
      ),
    );
  }
}
