class Person {
  String name;
  String phoneNumber;
  String imageUrl;

  Person({this.name, this.phoneNumber, this.imageUrl});

  Person.fromJson(Map<String, dynamic> json)
      : name =
            '${json["name"]["title"]} ${json["name"]["first"]} ${json["name"]["last"]}',
        phoneNumber = json["phone"],
        imageUrl = json["picture"]["thumbnail"];
}
