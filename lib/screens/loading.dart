import "../services/world_time.dart";
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading";

  void setupWorldTime() async {

    WorldTime instance = WorldTime(flag:"flag", url:"Africa/Accra");
    await instance.getTime();
    await instance.getIpData();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "time": instance.time,
      "location": instance.location,
      "isDayTime": instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: SpinKitCircle(
          color: Colors.amber,
          size: 70.0,
        ),
      ),
    );
  }
}
