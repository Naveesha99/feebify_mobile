import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Color myColor;
  late Size mediaSize;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage('assets/images/bg.jpeg'),
          fit: BoxFit.cover,
          colorFilter:
            ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 0, left: 0, right: 0, child: _buildTop()),
          Positioned(top: 100, child: middle()),
          Positioned(bottom: 0, child: buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          'assets/images/logo.png',
          width: 100,
          height: 100,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu),
        color: Colors.white,
        padding: const EdgeInsets.all(5.0),
      ),
    ],

  );

  Widget middle() => Container(
    width: mediaSize.width,
    child: const Column(
      children: [
        SizedBox(height: 20), // Add space at the top
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding around the text
          child: Text(
            'Welcome to the app!', // The text you want to display
            style: TextStyle(
              fontSize: 24.0, // Text size
              fontWeight: FontWeight.bold, // Bold text
              color: Colors.black, // Text color
            ),
            textAlign: TextAlign.center, // Center align the text
          ),
        ),
      ],
    ),
  );

  // Widget navbar
  Widget buildBottom() => Container(
      width: mediaSize.width,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: const Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.home),
              Icon (Icons.qr_code),
              Icon(Icons.person),
            ],
          ),
        ],
      ),
    );
}

