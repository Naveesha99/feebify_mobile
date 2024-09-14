import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fl_chart/fl_chart.dart';

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
          Positioned(top: 200, child: pieChart()),
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
            'Cloak distribution', // The text you want to display
            style: TextStyle(
              fontSize: 24.0, // Text size
              fontWeight: FontWeight.bold, // Bold text
              color: Colors.white, // Text color
            ),
            textAlign: TextAlign.center, // Center align the text
          ),
        ),
      ],
    ),
  );

  Widget pieChart() => Container(
    width: mediaSize.width,
    height: 200,
    child: PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Colors.white,
            value: 40, // Represents 40% of the chart
            title: 'borrowed',
            radius: 50,
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          PieChartSectionData(
            color: Colors.grey,
            value: 30, // Represents 30% of the chart
            title: 'returned',
            radius: 50,
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          PieChartSectionData(
            color: Colors.white70,
            value: 30, // Represents 30% of the chart
            title: 'available',
            radius: 50,
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
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

