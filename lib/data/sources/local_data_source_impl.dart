import 'dart:convert';

import 'package:fav/core/utils/shared_preferences_scheme.dart';
import 'package:fav/data/models/movie_model/movie_model.dart';
import 'package:fav/domain/entities/movie.dart';
import 'package:fav/domain/sources/i_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceImpl implements ILocalDataSource {
  const LocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<List<MovieModel>> getCachedFavoriteMovies() async {
    final moviesJson = _prefs.getStringList(SharedPreferencesScheme.favorites);
    if (moviesJson == null) return const [];

    final movieModels = moviesJson.map((movieJson) {
      final movieMap = jsonDecode(movieJson);
      return MovieModel.fromJson(movieMap);
    }).toList();

    return movieModels;
  }

  @override
  Future<void> cacheFavoriteMovie(Movie movie) {
    final moviesJson =
        _prefs.getStringList(SharedPreferencesScheme.favorites) ?? [];

    final movieModel = MovieModel(
      id: movie.id,
      title: movie.title,
      overview: movie.overview,
      posterPath: movie.posterPath,
      voteAverage: movie.voteAverage,
      releaseDate: movie.releaseDate,
    );

    final movieJson = jsonEncode(movieModel.toJson());
    moviesJson.add(movieJson);

    return _prefs.setStringList(SharedPreferencesScheme.favorites, moviesJson);
  }

  @override
  Future<void> removeFavoriteMovie(int movieId) async {
    final moviesJson = _prefs.getStringList(SharedPreferencesScheme.favorites);
    if (moviesJson == null) return;

    final updatedList = moviesJson.where((movieJson) {
      final movieMap = jsonDecode(movieJson);

      return movieMap['id'] != movieId;
    }).toList();

    await _prefs.setStringList(SharedPreferencesScheme.favorites, updatedList);
  }
}
