import 'package:movie_app/data/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app/utils/base_url.dart';

class MovieRepositoryServer {
  static http.Client httpClient = http.Client();

  static Future<Movie> fetchMovieById(int id) async {
    String url = baseUrlApiOnline + id.toString() + "?api_key=" + api_key;
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  static Future<Map<String, dynamic>> listRecommendationMoviesByUserId(
      int userId) async {
    String url = baseUrlServer + recommendationMoviesUrl;
    print(url);
    http.Response response = await http.post(url,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, int>{'user_id': userId}));

    Map<String, dynamic> resData = json.decode(response.body);
    print(resData.values);
    return resData;
  }

  // static Future<List<int>> searchMovies(String title) async {
  //   String url = 'http://10.0.2.2:8000/api/search_movies?title=' +
  //       title.trim().replaceAll(' ', '%20');
  //   http.Response response = await http.get(url);

  //   List<dynamic> data = json.decode(response.body);
  //   List<int> listMovieId = new List<int>();
  //   for (int i = 0; i < data.length; i++) {
  //     listMovieId.add(data[i]['movie_id']);
  //   }
  //   return listMovieId;
  // }
}
