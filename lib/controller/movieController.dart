import 'package:get/state_manager.dart';
import 'package:movie_app/model/detailedMovieModel.dart';
import 'package:movie_app/model/trendingMovieModel.dart';
import 'package:movie_app/services/apiService.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  List<TrendingMovie> trendingMovies = <TrendingMovie>[].obs;
  List<TrendingMovie> searchedMovies = <TrendingMovie>[].obs;
  var movie = DetailedMovie(
    bgURL: '',
    category: [],
    id: '',
    overview: '',
    posterURL: '',
    rating: '',
    releaseYear: '',
    title: '',
    budget: 0,
    revenue: 0,
    runtime: 0,
  ).obs;

  var selectedMovie = TrendingMovie(
          bgURL: '',
          category: [],
          id: '',
          overview: '',
          posterURL: '',
          rating: '',
          releaseYear: '',
          title: '')
      .obs;

  var favoriteMovie = TrendingMovie(
          bgURL: '',
          category: [],
          id: '',
          overview: '',
          posterURL: '',
          rating: '',
          releaseYear: '',
          title: '')
      .obs;

  @override
  void onInit() {
    getTrendingMovies();
    super.onInit();
  }

  void selectedMovies(int index) {
    selectedMovie(trendingMovies[index]);
  }

  void getSearchedMovie(String movieName) async {
    isLoading(true);
    var _movies = await APIService.getSearchedMovie(movieName);
    if (_movies != null) {
      searchedMovies = _movies;
    }
    isLoading(false);
  }

  void getTrendingMovies() async {
    isLoading(true);
    var _movies = await APIService.getTrendingMovie();
    if (_movies != null) {
      trendingMovies = _movies;
      selectedMovies(0);
    }
    isLoading(false);
  }

  void getMovieDetail(String id) async {
    isLoading(true);
    var _movie = await APIService.getMovieDetail(id);
    if (_movie != null) {
      movie(_movie);
    }
    isLoading(false);
  }
}
