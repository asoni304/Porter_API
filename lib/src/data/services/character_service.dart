import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/character.dart';



class CharacterService{
final url='https://hp-api.onrender.com/api/characters';
var data=[];
List<Character> results = [];


Future<List<Character>> fetchCharacters({ String? query}) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {

    print(response.body); // the print functions as a unit test,to see if working
    data = jsonDecode(response.body);
    results = data.map((e) => Character.fromJson(e)).toList();

    //filters search results by name
    if(query !=null){
     results = results.where((element) => element.name.toLowerCase()
         .contains(query.toLowerCase())).toList();

    }
    return results;

  } else {
    throw Exception('Failed to load characters');
  }
}

}
