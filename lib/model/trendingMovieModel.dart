import 'package:movie_app/model/generesModel.dart';

class TrendingMovie {
  late String? rating;
  late String? overview;
  late String releaseYear;
  late String? bgURL;
  late String? posterURL;
  late String title;
  late String id;
  late List<Genre> category;

  TrendingMovie({
    required this.id,
    required this.rating,
    required this.overview,
    required this.releaseYear,
    required this.bgURL,
    required this.posterURL,
    required this.title,
    required this.category,
  });

  TrendingMovie.fromMap(Map<String, dynamic> map) {
    id = map["id"].toString();
    rating = map['vote_average'].toString();
    overview = map['overview'];
    releaseYear = map['release_date'].toString();
    bgURL = map['backdrop_path'];
    posterURL = map['poster_path'];
    title = map['title'];
    category = <Genre>[];
    for (var id in map['genre_ids']) {
      for (var cat in genre) {
        if (cat.id == id) {
          category.add(cat);
        }
      }
    }
  }

  toJson() {
    return {
      "id": id,
      "rating": rating,
      "overview": overview,
      "releaseDate": releaseYear,
      "bgURL": bgURL,
      "posterURL": posterURL,
      "title": title,
      "category": category,
    };
  }
}
