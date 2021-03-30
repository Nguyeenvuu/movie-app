class Rating {
  int _userId;
  int _movieId;
  double _rating;
  int _timeRating;

  int get userId => this._userId;
  int get movieId => this._movieId;
  double get rating => this._rating;
  int get timeRating => this._timeRating;

  Rating(this._userId, this._movieId, this._rating, this._timeRating);
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      json['user_id'],
      json['movie_id'],
      json['rating'],
      json['time_rating'],
    );
  }

  @override
  String toString() {
    return '''
  user_id: $_userId,
  movie_id: $_movieId,
  rating: $_rating
  ''';
  }
}
