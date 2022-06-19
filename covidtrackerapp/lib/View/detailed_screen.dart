import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String image;

  String name;

  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailScreen({
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

          children: [

        Stack(
            alignment: Alignment.topCenter,
          children: [Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * .07),
            child: Container(
              width: double.infinity,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .06,),
                    ReusableRow(title: "Cases", value: widget.totalCases.toString()),
                    ReusableRow(
                        title: "Recovered", value: widget.totalRecovered.toString()),
                    ReusableRow(title: "Death", value: widget.totalDeaths.toString()),
                    ReusableRow(title: "Active", value: widget.active.toString()),
                    ReusableRow(title: "Crtical", value: widget.critical.toString()),
                    ReusableRow(
                        title: "Today Recovered",
                        value: widget.todayRecovered.toString()),
                    ReusableRow(title: "Tests", value: widget.test.toString()),
                  ],
                ),
              ),
            ),
          ),

            Positioned(

              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.image),
                radius: 45,
              ),
            ),
    ]
        )
      ]),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title;
  final String value;

  const ReusableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Divider(),
      ],
    );
  }
}
