import 'dart:convert';

import 'package:http/http.dart';
import 'package:network_request/model/person.dart';
import 'package:http/http.dart' as http;

const String randomUserURL = "https://randomuser.me/api/";

class PersonNetworkService {
  Future<List<Person>> fetchPersons(int amountOfPerson) async {
    try {
      Response response =
          await http.get("$randomUserURL?results=$amountOfPerson");
      if (response.statusCode == 200) {
        Map personMap = jsonDecode(response.body);
        List<dynamic> allPersons = personMap["results"];
        return allPersons.map((json) => Person.fromJson(json)).toList();
      } else {
        print("Request failed: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
