import 'dart:convert';

import 'package:filmmediadb/src/movies/movie_item.dart';
import 'package:http/http.dart' as http;

class HTTPService {

  Future<List<MovieItem>> fetchMovies() async {
    const apiKey = 'c703782bbc9d49d34aae2a66dfdb13ee'; // Reemplaza con tu clave de API de TMDb
    const url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

    List<MovieItem> itemList = List.empty(growable: true);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      for (var element in data["results"]) {
        itemList.add(MovieItem.fromJSON(element));
      }
      //itemList
    } else {
      throw Exception('Error al cargar las películas');
    }

    return itemList;
  }
}