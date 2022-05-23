import 'package:flutter/material.dart';

import '../model/movie.dart';
import '../repository/movie_repository.dart';

class MovieController extends ChangeNotifier {
  final _movieRepository = MovieRepository();
  var movies = <Movie>[];
  var activeGenreId = -1;

  Future<List<Map<String, dynamic>>> loadGenre() async {
    var genreList = await _movieRepository.loadGenre();
    if (genreList.isNotEmpty) {
      activeGenreId = genreList.first['id'].toInt();
      _loadMovieListWithGenre();
    }
    return genreList;
  }

  void _loadMovieListWithGenre() async {
    movies = await _movieRepository.loadMovieListWithGenre(activeGenreId);
    notifyListeners();
  }

  void changeCategory(Map<String, dynamic> genre) {
    activeGenreId = genre["id"];
    notifyListeners();
    _loadMovieListWithGenre();
  }
}

