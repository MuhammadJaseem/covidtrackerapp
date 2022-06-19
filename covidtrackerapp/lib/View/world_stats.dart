import 'package:covidtrackerapp/Model/WorldStatsModel.dart';
import 'package:covidtrackerapp/Services/stats_services.dart';
import 'package:covidtrackerapp/View/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widget/build_spacer.dart';

class WorldStats extends StatefulWidget {
  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> with TickerProviderStateMixin {
  // Map<String, double> dataMap = {
  final List<Color> colorList = [
    Color(0XFF4285f4),
    Color(0XFF1aa260),
    Color(0XFFde5246),
  ];



  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 1));

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    StatsServices _statsServices = StatsServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10, bottom: 4),
          child: Column(
            children: [
              Expanded(
                  child: FutureBuilder(
                future: _statsServices.fetchWorldStatsApi(),
                builder: (context, AsyncSnapshot<WorldStatsModel> snapshot) {
                  if (!snapshot.hasData) {

                    return Center(
                      child: SpinKitFadingCircle(
                        controller: _controller,
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total":
                                double.parse(snapshot.data!.cases.toString()),
                            "Recovered": double.parse(
                                snapshot.data!.recovered.toString()),
                            "Deaths":
                                double.parse(snapshot.data!.deaths.toString()),
                          },
                          animationDuration: Duration(seconds: 3),
                          colorList: colorList,
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          chartType: ChartType.ring,
                          chartRadius: 110,
                          legendOptions: LegendOptions(
                              legendPosition: LegendPosition.left),
                        ),
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        Card(
                          child: Column(
                            children: [
                              ResuableRow(
                                  title: 'Total',
                                  val: snapshot.data!.cases.toString()),
                              ResuableRow(
                                  title: 'Deaths',
                                  val: snapshot.data!.deaths.toString()),
                              ResuableRow(
                                  title: 'Recovered',
                                  val: snapshot.data!.recovered.toString()),
                              ResuableRow(
                                  title: 'Active',
                                  val: snapshot.data!.active.toString()),
                              ResuableRow(
                                  title: 'Critical',
                                  val: snapshot.data!.critical.toString()),
                              ResuableRow(
                                  title: 'Today Deaths',
                                  val: snapshot.data!.todayDeaths.toString()),
                              ResuableRow(
                                  title: 'Today Recovered',
                                  val: snapshot.data!.todayRecovered.toString())
                            ],
                          ),
                        ),
                        buildSizedBox(size, 0.06),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CountriesListScreen()));
                            },
                            child: Text('Track Countries'),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.026),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              primary: Colors.white,
                              backgroundColor: Color(0XFF1aa260),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class ResuableRow extends StatelessWidget {
  final String title;
  final String val;

  ResuableRow({required this.title, required this.val});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 7.0, left: 10, right: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 13),
              ),
              Text(val),
            ],
          ),
          buildSizedBox(size, 0.004),
          Divider(),
        ],
      ),
    );
  }
}
