import 'package:fav/data/models/movie_model/movie_model.dart';
import 'package:fav/domain/entities/movie.dart';

abstract class ILocalDataSource {
  Future<List<MovieModel>> getCachedFavoriteMovies();
  Future<void> cacheFavoriteMovie(Movie movie);
  Future<void> removeFavoriteMovie(int movieId);
}
