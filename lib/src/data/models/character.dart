
class Character{
 String image;
 String name;
 String house;
 String actor;
 String species;
 String ancestry;
 String eyeColor;
 String hairColor;
 String dob;
 String gender;
 //String yob;
 String id;

 Character({required this.image,required this.id,required this.ancestry,
  required this.gender,required this.dob,required this.actor,
  required this.eyeColor,required this.hairColor,
  required this.house,required this.name,required this.species});
 factory Character.fromJson(Map <String,dynamic> json){
   return Character(
       image: json['image'] ?? "",
       id: json['id'] ?? "",
       ancestry: json['ancestry'] ?? "",
       gender:json['gender'] ?? "",
       house:json['house'] ?? "",
       name:json['name'] ?? "",
       actor: json['actor'] ?? "",
       eyeColor: json['eyeColour'] ?? "",
       hairColor: json['hairColour'] ?? "",
       dob: json['dateOfBirth'] ?? "",
      // yob: json['yearOfBirth'] ?? "",
       species: json['species'] ?? ""
   );
 }

}
