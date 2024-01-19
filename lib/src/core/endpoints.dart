class EndpointResource {
  final String base = "https://api.themoviedb.org/3";

  //list
  final String discover = "/discover/movie";
  final String search = "/search/movie";

  //genres
  final String genres = "/genre/movie/list";

  //movie
  final String details = "/movie/{movie_id}";
  final String related = "/movie/{movie_id}/similar";
  final String reviews = "/movie/{movie_id}/reviews";

}