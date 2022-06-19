import 'package:covidtrackerapp/View/detailed_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Services/stats_services.dart';

class CountriesListScreen extends StatefulWidget {
  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  StatsServices _statsServices = StatsServices();

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'search with country name',
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: _statsServices.fetchCountriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10, top: 10),
                              child: ListTile(
                                title: Container(
                                  width: 69,
                                  height: 10,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  width: 69,
                                  height: 10,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  width: 69,
                                  height: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];
                          if (_searchController.text.isEmpty) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10, top: 10),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => DetailScreen(
                                            image: snapshot.data![index]
                                            ['countryInfo']['flag'],
                                            name: snapshot.data![index]
                                            ['country'],
                                            totalCases: snapshot
                                                .data![index]['cases'],
                                            totalRecovered: snapshot
                                                .data![index]['recovered'],
                                            totalDeaths: snapshot
                                                .data![index]['deaths'],
                                            active: snapshot.data![index]
                                            ['active'],
                                            test: snapshot.data![index]
                                            ['tests'],
                                            todayRecovered:
                                            snapshot.data![index]
                                            ['todayRecovered'],
                                            critical: snapshot.data![index]
                                            ['critical'],
                                          )));
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(
                                      snapshot.data![index]['cases'].toString()),
                                  leading: Image(
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']!['flag']),
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(_searchController.text.toLowerCase())) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10, top: 10),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => DetailScreen(
                                            image: snapshot.data![index]
                                            ['countryInfo']['flag'],
                                            name: snapshot.data![index]
                                            ['country'],
                                            totalCases: snapshot
                                                .data![index]['cases'],
                                            totalRecovered: snapshot
                                                .data![index]['recovered'],
                                            totalDeaths: snapshot
                                                .data![index]['deaths'],
                                            active: snapshot.data![index]
                                            ['active'],
                                            test: snapshot.data![index]
                                            ['tests'],
                                            todayRecovered:
                                            snapshot.data![index]
                                            ['todayRecovered'],
                                            critical: snapshot.data![index]
                                            ['critical'],
                                          )));
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(
                                      snapshot.data![index]['cases'].toString()),
                                  leading: Image(
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']!['flag']),
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
