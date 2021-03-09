import 'package:flutter/material.dart';
import 'package:flutter_pro_0002/painters/home_paint.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            color: Colors.white,
          ),
          SizedBox.expand(
            child: CustomPaint(
              painter: HomePaint(
                animation: controller.view,
              ),
            ),
          ),
          Positioned(
            right: 30.0,
            top: 140.0,
            child: Text(
              "Animation Screen",
              style: TextStyle(
                color: Colors.white,
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text("Click Animation"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () async {
                await controller.forward();
                Future.delayed(Duration(seconds: 2), () => controller.reset());
              },
            ),
          )
        ],
      ),
    );
  }
}
