import 'package:movie_app/repositories/movie_repository_server.dart';

Future<void> main() async {
  print(DateTime.now());
  // List<Comment> listComent =
  //     await CommentRepositoryServer.listCommentByUserId(8);
  // listComent.forEach(print);

  // List<Rating> listRating =
  //     await RatingRepositoryServer.listRatingByMovieId(16);
  // listRating.forEach(print);
  Map<String, dynamic> recommnedation =
      await MovieRepositoryServer.listRecommendationMoviesByUserId(8);
  // print(recommnedation);
}
