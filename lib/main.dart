import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('bg-splash.jpg'), fit: BoxFit.cover)),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('yubis-logo.png'))),
          )
        ]));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image(
          image: AssetImage("yubis-logo.png"),
          width: 500,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.black,
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is search')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            color: Colors.black,
            tooltip: 'Go to the next page',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Shoping Bag')));
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 360.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('banner1.jpeg'), fit: BoxFit.cover)),
            ),
            Container(
                width: 360.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('banner2.jpeg'), fit: BoxFit.cover))),
            Container(
                width: 360.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('banner3.jpeg'), fit: BoxFit.cover))),
          ],
        ),
      ),
    );
  }
}
