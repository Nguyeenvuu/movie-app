const String api_key = "c96baf2da7e2bb718a017f316ac6c905";
const String baseUrlApiOnline = "http://api.themoviedb.org/3/";

final movieUrlDetailOnline =
    (idMovie) => "${baseUrlApiOnline}movie/${idMovie}?api_key=${api_key}";
final movieSearchUrlOnline = (query) =>
    "${baseUrlApiOnline}search/movie?api_key=${api_key}&query=${query}";

const String baseUrlServer = 'http://127.0.0.1:8000';
const String customerUrlLogin = '/customer/login/';
const String customerUrlRegister = '/customer/register/';
const String recommendationMoviesUrl = '/recommendations/';
const String commentByMovieUrl = '/comment/movie/';
const String commentByCustomerUrl = '/comment/customer/';
const String ratingByUserIdUrl = '/ratings/customer/';
const String ratingByMovieIdUrl = '/ratings/movie/';
