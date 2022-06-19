import 'dart:convert';

import 'package:covidtrackerapp/Model/CountriesListModel.dart';
import 'package:covidtrackerapp/Model/WorldStatsModel.dart';
import 'package:covidtrackerapp/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;
class StatsServices{

  Future <WorldStatsModel>fetchWorldStatsApi()async{
    final reponse=await http.get(Uri.parse(Appurl.worldStatsApi));

    if(reponse.statusCode==200){
      var data =jsonDecode(reponse.body);

      return WorldStatsModel.fromJson(data);
    }
    else{
      throw Exception('Error');
    }
  }

  Future<List<dynamic>>fetchCountriesListApi()async{

    final response=await http.get(Uri.parse(Appurl.countriesList));
    var data=jsonDecode(response.body);
    if(response.statusCode==200){





    return data;

    }

    else{
      throw Exception('error');
    }


  }
}