import 'dart:convert';

import 'package:filmmediadb/src/core/endpoints.dart';
import 'package:filmmediadb/src/models/movie_detail.dart';
import 'package:filmmediadb/src/models/movie_item.dart';
import 'package:http/http.dart' as http;

class HTTPService {

  final _apiKey = 'c703782bbc9d49d34aae2a66dfdb13ee';

  Future<List<MovieItem>> fetchMovies() async {
    
    final url = '${EndpointResource.base}${EndpointResource.popular}?api_key=$_apiKey';

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

  Future<MovieDetail> getMovieDetail(int movieId) async {
    final url = '${EndpointResource.base}${EndpointResource.details.replaceAll("{movie_id}", movieId.toString())}?api_key=$_apiKey';

    final response = await http.get(Uri.parse(url));

    MovieDetail result = MovieDetail.empty();

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
      result = MovieDetail.fromJson(data);
      //Movie show
    } else {
      throw Exception('Error al cargar las películas');
    }

    return result;
  }
}