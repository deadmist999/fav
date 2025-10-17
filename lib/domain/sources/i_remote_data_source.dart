import 'package:fav/data/models/movie_model/movie_model.dart';

abstract class IRemoteDataSource {
  Future<List<MovieModel>> fetchTopRatedMovies();
  Future<MovieModel> fetchMovie(String id);

  Future<List<MovieModel>> findMoviesByName(String name);
}
