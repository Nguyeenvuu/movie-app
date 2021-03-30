import 'package:http/http.dart' as http;

import 'package:movie_app/data/models/rating.dart';
import 'dart:convert';

import 'package:movie_app/utils/base_url.dart';

class RatingRepositoryServer {
  static http.Client httpClient = http.Client();

  static Future<List<Rating>> listRatingByMovieId(int movieId) async {
    List<Rating> listRating = List<Rating>();
    String url = baseUrlServer + ratingByMovieIdUrl + '$movieId';
    print(url);
    http.Response response = await http.get(url);
    List resData = json.decode(response.body);

    if (response.statusCode == 200) {
      resData.forEach((rating) {
        int user_id = rating['user'];
        int movieId = rating['movie'];
        double rt = rating['rating'];
        var timeStamp = rating['time_rating'];
        Rating newComment = Rating(user_id, movieId, rt, timeStamp);
        listRating.add(newComment);
      });
      return listRating;
    } else {
      return List<Rating>();
    }
  }

  static Future<List<Rating>> listRatingByUserId(int userId) async {
    List<Rating> listRating = List<Rating>();
    String url = baseUrlServer + ratingByUserIdUrl + '$userId';
    print(url);
    http.Response response = await http.get(url);
    List resData = json.decode(response.body);

    if (response.statusCode == 200) {
      resData.forEach((rating) {
        int user_id = rating['user'];
        int movieId = rating['movie'];
        double rt = rating['rating'];

        var timeStamp = rating['time_rating'];
        Rating newComment = Rating(user_id, movieId, rt, timeStamp);
        listRating.add(newComment);
      });
      return listRating;
    } else {
      return List<Rating>();
    }
  }
}
