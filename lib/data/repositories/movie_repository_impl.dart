import 'package:fav/domain/entities/movie.dart';
import 'package:fav/domain/repositories/i_movie_repository.dart';
import 'package:fav/domain/sources/i_local_data_source.dart';
import 'package:fav/domain/sources/i_remote_data_source.dart';

class MovieRepositoryImpl implements IMovieRepository {
  const MovieRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final IRemoteDataSource _remoteDataSource;
  final ILocalDataSource _localDataSource;

  @override
  Future<List<Movie>> fetchTopRatedMovies() async {
    try {
      final movieModels = await _remoteDataSource.fetchTopRatedMovies();

      return movieModels.map((model) => model.toDomain()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Movie> fetchMovie(String id) async {
    try {
      final model = await _remoteDataSource.fetchMovie(id);

      return model.toDomain();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> findMoviesByName(String name) async {
    final movieModels = await _remoteDataSource.findMoviesByName(name);

    return movieModels.map((model) => model.toDomain()).toList();
  }

  @override
  Future<List<Movie>> getCachedFavoriteMovies() async {
    final models = await _localDataSource.getCachedFavoriteMovies();
    if (models.isEmpty) return const [];

    return models.map((model) => model.toDomain()).toList();
  }

  @override
  Future<void> cacheFavoriteMovie(Movie movie) =>
      _localDataSource.cacheFavoriteMovie(movie);

  @override
  Future<void> removeFavoriteMovie(int movieId) =>
      _localDataSource.removeFavoriteMovie(movieId);
}
