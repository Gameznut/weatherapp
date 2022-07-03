import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    var bgColor = data["isDayTime"] ? Colors.blue[100] : Colors.indigo[900];
    var textColor = data["isDayTime"] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 0),
        child: SafeArea(
          child: Column(
            children: [
              TextButton.icon(
                label: const Text("Edit Location"),
                icon: const Icon(Icons.edit_location),
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, "/location");
                  setState((){
                    data = {
                      'time' : result['time'],
                      'isDayTime' : result['isDayTime'],
                      'location' : result['location']
                    };
                  });
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: TextStyle(
                        fontSize: 28.0, letterSpacing: 2.0, color: textColor),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                data["time"],
                style: TextStyle(
                    fontSize: 48.0, letterSpacing: 2.0, color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
