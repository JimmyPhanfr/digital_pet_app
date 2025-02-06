import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(DigitalPetApp());
}

class DigitalPetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PetHomePage(),
    );
  }
}

class PetHomePage extends StatefulWidget {
  @override
  _PetHomePageState createState() => _PetHomePageState();
}

class _PetHomePageState extends State<PetHomePage> {
  int happiness = 50;
  int hunger = 50;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startDecay();
  }

  void _startDecay() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        hunger = (hunger + 5).clamp(0, 100);
        happiness = (happiness - 5).clamp(0, 100);
      });
    });
  }

  void _feedPet() {
    setState(() {
      hunger = (hunger - 10).clamp(0, 100);
      happiness = (happiness + 5).clamp(0, 100);
    });
  }

  void _playWithPet() {
    setState(() {
      happiness = (happiness + 10).clamp(0, 100);
      hunger = (hunger + 5).clamp(0, 100);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Digital Pet")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Happiness: $happiness", style: TextStyle(fontSize: 20)),
          Text("Hunger: $hunger", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _feedPet,
            child: Text("Feed Pet"),
          ),
          ElevatedButton(
            onPressed: _playWithPet,
            child: Text("Play with Pet"),
          ),
        ],
      ),
    );
  }
}
