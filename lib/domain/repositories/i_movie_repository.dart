import '../entities/movie.dart';

abstract class IMovieRepository {
  Future<List<Movie>> fetchTopRatedMovies();
  Future<Movie> fetchMovie(String id);

  Future<List<Movie>> findMoviesByName(String name);

  Future<List<Movie>> getCachedFavoriteMovies();
  Future<void> cacheFavoriteMovie(Movie movie);
  Future<void> removeFavoriteMovie(int movieId);
}
