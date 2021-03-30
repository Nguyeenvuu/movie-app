import 'package:http/http.dart' as http;
import 'package:movie_app/data/models/movie_detail_online.dart';
import 'package:movie_app/data/models/movie_online.dart';
import 'dart:convert';
import 'package:movie_app/utils/base_url.dart';

abstract class MovieRepository {
  //Future<List<Results>> getMovies(String movieType);
  Future<MovieDetail> getMovieDetail(String movieType);

  Future<List<ResultsMovieOnline>> getMoviesBySearch(String query);
}

class MovieRepositoryOnline implements MovieRepository {
  @override
  Future<MovieDetail> getMovieDetail(String movieType) async {
    var response = await http.get(movieUrlDetailOnline(movieType));
    // var response = await http.get(baseUrl + "movie/upcoming?api_key=$key");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      MovieDetail movies = MovieDetail.fromJson(data);
      return movies;
    } else {
      throw Exception();
    }
  }

  Future<List<ResultsMovieOnline>> getMoviesBySearch(String query) async {
    var response = await http.get(movieSearchUrlOnline(query));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<ResultsMovieOnline> movies =
          ApiResultMovieOnline.fromJson(data).results;
      return movies;
    } else {
      throw Exception();
    }
  }
}
