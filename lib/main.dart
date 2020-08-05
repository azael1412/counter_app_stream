import 'package:flutter/material.dart';
import 'dart:async';

import 'package:counter_app_stream/counter_stream.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterStream counterStream = CounterStream();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          StreamBuilder<int>(
              // initialData: 0,
              stream: this.counterStream.counterUpdates,
              builder: (context, snappShot) {
                String valueAsString = '0';
                if (snappShot != null && snappShot.hasData) {
                  valueAsString = snappShot.data.toString();
                }
                return Text(
                  valueAsString,
                  style: Theme.of(context).textTheme.display1,
                );
              }),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: this.counterStream.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
