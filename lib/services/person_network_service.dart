import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:network_request/model/person.dart';

const String randomPersonURL = "https://randomuser.me/api/";

class PersonNetworkService {
  Future<List<Person>> fetchPersons(int amount) async {
    http.Response response = await http.get("$randomPersonURL?results=$amount");

    if (response.statusCode == 200) {
      Map peopleData = jsonDecode(response.body);
      List<dynamic> peoples = peopleData["results"];
      return peoples.map((json) => Person.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}
