import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/models/character.dart';

class CharacterScreen extends StatefulWidget {

Character character;
   CharacterScreen(
       {required this.character});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(widget.character.name,
            style: TextStyle(color: Colors.white)
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height*0.4,
                width: width,
                child: Image.network(widget.character.image)
              ),
              Text(
                widget.character.name,
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                'House: ${widget.character.house}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Ancestry: ${widget.character.ancestry}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Actor: ${widget.character.actor}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Species: ${widget.character.species}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'HairColour: ${widget.character.hairColor}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'EyeColour: ${widget.character.eyeColor}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'DateOfBirth: ${widget.character.dob}',
                style: const TextStyle(fontSize: 16.0),
              ),
              // const SizedBox(height: 8.0),
              // Text(
              //   'YearOfBirth: ${widget.character.yob.toString()}',
              //   style: const TextStyle(fontSize: 16.0),
              // ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
