import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinWheel extends StatefulWidget {
  @override
  _SpinWheelState createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            child: FortuneWheel(
              animateFirst: false,
              selected: selected,
              physics: CircularPanPhysics(
                duration: Duration(seconds: 1),
                curve: Curves.decelerate,
              ),
              onFling: () {
                setState(() {
                  selected = Random().nextInt(4);
                });
              },
              styleStrategy: UniformStyleStrategy(
                borderColor: Colors.black,
                color: Colors.red,
                borderWidth: 5,
              ),
              items: [
                FortuneItem(child: Text("10", style: TextStyle(
                  color: Colors.white,
                ),)),
                FortuneItem(child: Text("20", style: TextStyle(
                  color: Colors.white,
                ),)),
                FortuneItem(child: Text("50", style: TextStyle(
                  color: Colors.white,
                ),)),
                FortuneItem(child: Text("100", style: TextStyle(
                  color: Colors.white,
                ),)),
                FortuneItem(child: Text("200", style: TextStyle(
                  color: Colors.white,
                ),)),
              ],
              onAnimationEnd: () {
                print("Value : " + "$selected");
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selected = Random().nextInt(4);
              });
            },
            child: Container(
              color: Colors.blue,
              height: 20,
              width: 100,
              child: Center(child: Text("SPIN"),),
            ),
          )
        ],
      ),
    );
  }
}
