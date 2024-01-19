// {
//   "adult": false,
//   "backdrop_path": "/f1AQhx6ZfGhPZFTVKgxG91PhEYc.jpg",
//   "belongs_to_collection": null,
//   "budget": 165000000,
//   "genres": [
//     {
//       "id": 36,
//       "name": "History"
//     },
//     {
//       "id": 10752,
//       "name": "War"
//     },
//     {
//       "id": 18,
//       "name": "Drama"
//     }
//   ],
//   "homepage": "https://www.napoleon.movie",
//   "id": 753342,
//   "imdb_id": "tt13287846",
//   "original_language": "en",
//   "original_title": "Napoleon",
//   "overview": "An epic that details the checkered rise and fall of French Emperor Napoleon Bonaparte and his relentless journey to power through the prism of his addictive, volatile relationship with his wife, Josephine.",
//   "popularity": 1811.36,
//   "poster_path": "/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg",
//   "production_companies": [
//     {
//       "id": 1645,
//       "logo_path": "/6Ry6uNBaa0IbbSs1XYIgX5DkA9r.png",
//       "name": "Scott Free Productions",
//       "origin_country": "GB"
//     },
//     {
//       "id": 19108,
//       "logo_path": "/jWhpxFZd02PbcFtUSiCraifRZTC.png",
//       "name": "Latina Pictures",
//       "origin_country": "MT"
//     },
//     {
//       "id": 194232,
//       "logo_path": "/oE7H93u8sy5vvW5EH3fpCp68vvB.png",
//       "name": "Apple Studios",
//       "origin_country": "US"
//     }
//   ],
//   "production_countries": [
//     {
//       "iso_3166_1": "MT",
//       "name": "Malta"
//     },
//     {
//       "iso_3166_1": "GB",
//       "name": "United Kingdom"
//     },
//     {
//       "iso_3166_1": "US",
//       "name": "United States of America"
//     }
//   ],
//   "release_date": "2023-11-22",
//   "revenue": 213400000,
//   "runtime": 158,
//   "spoken_languages": [
//     {
//       "english_name": "English",
//       "iso_639_1": "en",
//       "name": "English"
//     },
//     {
//       "english_name": "French",
//       "iso_639_1": "fr",
//       "name": "Français"
//     },
//     {
//       "english_name": "German",
//       "iso_639_1": "de",
//       "name": "Deutsch"
//     },
//     {
//       "english_name": "Russian",
//       "iso_639_1": "ru",
//       "name": "Pусский"
//     }
//   ],
//   "status": "Released",
//   "tagline": "He came from nothing. He conquered everything.",
//   "title": "Napoleon",
//   "video": false,
//   "vote_average": 6.528,
//   "vote_count": 1267
// }

import 'package:filmmediadb/src/models/genre.dart';

class MovieDetail {
  MovieDetail({
    required this.id,
    required this.title,
    required this.genreList,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.posterPath,
    required this.backdropPath,
    required this.runtime,
    required this.popularity,
  });

  //Props 
  int id;
  String title;
  List<Genre> genreList;
  String overview;
  DateTime releaseDate;
  double voteAverage;
  int voteCount;
  String posterPath;
  String backdropPath;
  int runtime;
  double popularity;

  factory MovieDetail.empty() {
    return MovieDetail(
      id: 0,
      title: '',
      genreList: [],
      overview: '',
      releaseDate: DateTime.now(),
      voteAverage: 0.0,
      voteCount: 0,
      posterPath: '',
      backdropPath: '',
      runtime: 0,
      popularity: 0.0,
    );
  }

  MovieDetail.fromJson(Map<String, dynamic> json) 
    : id = json['id'],
      title = json['title'],
      genreList = json['genres'].map<Genre>((element) => Genre.fromJSON(element)).toList(),
      overview = json['overview'],
      releaseDate = DateTime.parse(json['release_date']),
      voteAverage = json['vote_average'].toDouble(),
      voteCount = json['vote_count'],
      posterPath = json['poster_path'],
      backdropPath = json['backdrop_path'],
      runtime = json['runtime'],
      popularity = json['popularity'].toDouble();
  
  
}