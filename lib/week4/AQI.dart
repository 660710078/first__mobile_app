import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AQI extends StatefulWidget {
  const AQI({super.key});

  @override
  State<AQI> createState() => _AQIState();
}

class _AQIState extends State<AQI> {
  StateData? stateData;

  @override
  void initState() {
    super.initState();
    fetchState();
  }

  void fetchState() async {
    try{
      var response = await http.get(Uri.parse('https://api.waqi.info/feed/here/?token=33b782438393009e4890ddf1b18d98d3f88318d6'));
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        StateData state = StateData.fromJson(data);
        setState(() {
          stateData = state;
        });
      } else {
        print('Failed to fetch data');

      }

    }
    catch(e){
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Air Quality Index (AQI)'),centerTitle: true,),
      body: Center(
            child: stateData == null
              ? const CircularProgressIndicator()
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${stateData!.city} ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 120,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: getColorForAQI(stateData!.aqi),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text("${stateData!.aqi}",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.white),),
                    )
                  ),
                  SizedBox(height: 8),
                  Text(getAQIDescription(stateData!.aqi),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: getColorForAQI(stateData!.aqi)),),
                  SizedBox(height: 16),
                  Text("temperature : ${stateData!.temperature} °C",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        stateData = null; 
                      });
                      fetchState(); 
                    },
                    child: const Text("Refresh"),
                  ),
              ],
            ),
          ),
      );
  }
}

class StateData {
  final int aqi;
  final String city;
  final dynamic temperature;

  StateData(this.aqi, this.city, this.temperature);

  StateData.fromJson(Map<String, dynamic> json)
      : aqi = json['data']['aqi'],
        city = json['data']['city']['name'],
        temperature = json['data']['iaqi']['t']['v'];
  Map<String,dynamic> toJson() {
   return {'aqi': aqi,'city': city,'temperature': temperature};
  }
}

Color getColorForAQI(int aqi) {
  if (aqi <= 50) {
    return Colors.green; 
  } else if (aqi <= 100) {
    return Colors.yellow; 
  } else if (aqi <= 150) {
    return Colors.orange; 
  } else if (aqi <= 200) {
    return Colors.red;
  } else if (aqi <= 300) {
    return Colors.purple;
  } else {
    return Colors.brown; 
  }
}

String getAQIDescription(int aqi) {
  if (aqi <= 50) {
    return "Good";
  } else if (aqi <= 100) {
    return "Moderate";
  } else if (aqi <= 150) {
    return "Unhealthy for Sensitive Groups";
  } else if (aqi <= 200) {
    return "Unhealthy";
  } else if (aqi <= 300) {
    return "Very Unhealthy";
  } else {
    return "Hazardous";
  }
}