class DetailedMovie {
  late String id;
  late String rating;
  late String overview;
  late String releaseYear;
  late String bgURL;
  late String posterURL;
  late String title;
  late List<String> category;
  late int budget;
  late int revenue;
  late int runtime;
  late bool isFavorite;

  DetailedMovie({
    required this.id,
    required this.rating,
    required this.overview,
    required this.releaseYear,
    required this.bgURL,
    required this.posterURL,
    required this.title,
    required this.category,
    required this.budget,
    required this.revenue,
    required this.runtime,
    this.isFavorite = false,
  });

  DetailedMovie.fromMap(Map<String, dynamic> map) {
    id = map["id"].toString();
    rating = map['vote_average'].toString();
    overview = map['overview'];
    releaseYear = map['release_date'].toString().substring(0, 4);
    bgURL = map['backdrop_path'];
    posterURL = map['poster_path'];
    title = map['title'];
    category = <String>[];
    for (var id in map['genres']) {
      category.add(id['name']);
    }
    budget = map['budget'];
    revenue = map['revenue'];
    runtime = map['runtime'];
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
      "budget": budget,
      "revenue": revenue,
      "runtime": runtime,
    };
  }
}
