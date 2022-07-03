import 'package:flutter/material.dart';
import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(int index) async {
    WorldTime place = locations[index];
    await place.getTime();

    if (!mounted) return;
    Navigator.pop(context, {
      "time": place.time,
      "location": place.location,
      "isDayTime": place.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (BuildContext context, int index) {
            int slash = locations[index].url.indexOf('/') + 1;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].url.substring(slash)),
                ),
              ),
            );
          }),
    );
  }
}
