import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _backgroundColor = Colors.green;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Counter:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$_counter',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text('Increment'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _resetCounter,
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _counter >= 1
          ? FloatingActionButton(
        onPressed: () {
          _changeBackgroundColor();
        },
        tooltip: 'Change Color',
        child: Icon(Icons.color_lens),
      )
          : null,
    );
  }

  void _changeBackgroundColor() {
    setState(() {
      final random = new Random();
      _backgroundColor =
          Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1.0);
    });
  }
}
