      // "adult": false,
      // "backdrop_path": "/f1AQhx6ZfGhPZFTVKgxG91PhEYc.jpg",
      // "genre_ids": [
      //   36,
      //   10752,
      //   18
      // ],
      // "id": 753342,
      // "original_language": "en",
      // "original_title": "Napoleon",
      // "overview": "An epic that details the checkered rise and fall of French Emperor Napoleon Bonaparte and his relentless journey to power through the prism of his addictive, volatile relationship with his wife, Josephine.",
      // "popularity": 2075.143,
      // "poster_path": "/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg",
      // "release_date": "2023-11-22",
      // "title": "Napoleon",
      // "video": false,
      // "vote_average": 6.5,
      // "vote_count": 1234

class MovieItem {
  MovieItem(this.id,this.title,this.releaseDate,this.voteAverage, this.imgPoster);

  int id;
  String title;
  DateTime releaseDate;
  double voteAverage;
  String imgPoster;

  MovieItem.fromJSON(json):
    id = json["id"],
    title = json["title"],
    releaseDate = DateTime.parse(json["release_date"]),
    voteAverage = json["vote_average"],
    imgPoster = json["poster_path"];
  
}
