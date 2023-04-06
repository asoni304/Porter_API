
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:porter/src/features/screens/character_screen.dart';
import '../../data/models/character.dart';
import '../../data/services/character_service.dart';
import '../widgets/search.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CharacterService client =CharacterService();
  late Future<List<Character>> _futureCharacters;
  late var width;
  late var height;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureCharacters = client.fetchCharacters();

  }



  @override
  Widget build(BuildContext context) {
     width = MediaQuery.of(context).size.width;
     height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: (){
                showSearch(context: context, delegate: SearchCharacter());
              },
              icon: const Icon(Icons.search)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
              child: Center(
                child: Text('Choose Your Character',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.deepOrangeAccent)
            ),),),
            SizedBox(
              height: height*0.9,
              child: FutureBuilder<List<Character>>(
                future: _futureCharacters,
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
                                  height: height *0.35,
                                  child: Image.network(characters.image)
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
            ),
          ],
        ),
      ),
    );
  }
}


