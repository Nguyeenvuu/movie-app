import 'package:http/http.dart' as http;
import 'package:movie_app/data/models/comment.dart';
import 'dart:convert';

import 'package:movie_app/utils/base_url.dart';

class CommentRepositoryServer {
  static http.Client httpClient = http.Client();

  static Future<List<Comment>> listCommentByUserId(int userId) async {
    List<Comment> listComent = List<Comment>();
    String url = baseUrlServer + commentByCustomerUrl + '$userId';
    print(url);
    http.Response response = await http.get(url);
    List resData = json.decode(response.body);

    if (response.statusCode == 200) {
      resData.forEach((comment) {
        int user_id = comment['user'] ?? userId;
        int movieId = comment['movie'] ?? 10;
        String content = comment['content'] ?? 'This is comment';

        var timeStamp = comment['timestamp'] != null
            ? DateTime.parse(comment['timestamp'])
            : DateTime.now();
        Comment newComment = Comment(user_id, movieId, content, timeStamp);
        listComent.add(newComment);
      });
      return listComent;
    } else {
      return List<Comment>();
    }
  }
}
