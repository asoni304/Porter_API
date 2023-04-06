import 'package:flutter/material.dart';

import '../../data/models/character.dart';
import '../../data/services/character_service.dart';
import '../screens/character_screen.dart';

class SearchCharacter extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: (){
        query= '';
      },
          icon: const Icon(Icons.close)) ,

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      Navigator.pop(context);
    },
        icon: const Icon(Icons.arrow_back_ios));
  }

  CharacterService client =CharacterService();

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.9,
      child: FutureBuilder<List<Character>>(
        future: client.fetchCharacters(query: query),
        builder: ( context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var characters = snapshot.data![index];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>
                            CharacterScreen(character: characters,)));
                  },

                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          child: Image.network(characters.image) ,
                        ),
                        Text(
                          characters.name,
                          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),

                        const Divider(),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return const Center(child: Text('Search Characters'));
  }
  
}