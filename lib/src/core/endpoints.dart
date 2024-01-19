class EndpointResource {
  static const String base = "https://api.themoviedb.org/3";

  //list
  static const String discover = "/discover/movie";
  static const String search = "/search/movie";
  static const String popular = "/movie/popular";

  //genres
  static const String genres = "/genre/movie/list";

  //movie
  static const String details = "/movie/{movie_id}";
  static const String related = "/movie/{movie_id}/similar";
  static const String reviews = "/movie/{movie_id}/reviews";

}