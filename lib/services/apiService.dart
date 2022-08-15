import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/detailedMovieModel.dart';
import 'package:movie_app/model/trendingMovieModel.dart';
import '../constants.dart';

class APIService {
  static var client = http.Client();
  static Future<List<TrendingMovie>?> getTrendingMovie() async {
    http.Response response = await client.get(Uri.parse(trendingEndPoint));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      List<TrendingMovie> _movies = <TrendingMovie>[];
      for (var movie in data) {
        _movies.add(TrendingMovie.fromMap(movie));
      }
      return _movies;
    } else {
      return null;
    }
  }

  static Future<DetailedMovie?> getMovieDetail(String id) async {
    http.Response response =
        await client.get(Uri.parse("$movieEndPoint$id$apiKey$crewEndPoint"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      DetailedMovie _detailedMovie = DetailedMovie.fromMap(data);
      return _detailedMovie;
    } else {
      return null;
    }
  }

  static Future<List<TrendingMovie>?> getSearchedMovie(String movieName) async {
    http.Response response =
        await client.get(Uri.parse("$searchMovie" + movieName));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      List<TrendingMovie> _movies = <TrendingMovie>[];
      for (var movie in data) {
        _movies.add(TrendingMovie.fromMap(movie));
      }
      return _movies;
    } else {
      return null;
    }
  }
}
