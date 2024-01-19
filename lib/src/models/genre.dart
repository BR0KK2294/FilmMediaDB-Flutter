class Genre{
  Genre(this.id,this.name);

  int id;
  String name;

  Genre.fromJSON(json):
    id = json["id"],
    name = json["name"];
}