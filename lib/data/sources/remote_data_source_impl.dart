import 'package:dio/dio.dart';
import 'package:fav/data/models/movie_model/movie_model.dart';
import 'package:fav/domain/sources/i_remote_data_source.dart';
import '../../core/utils/api_constants.dart';

class RemoteDataSourceImpl implements IRemoteDataSource {
  const RemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<MovieModel>> fetchTopRatedMovies() async {
    try {
      final response = await _dio.get(ApiConstants.topRatedMoviesPath);
      final responseModel = MovieListResponseModel.fromJson(response.data);

      return responseModel.movies;
    } on DioException catch (e) {
      throw Exception('Failed to load movies: ${e.message}');
    }
  }

  @override
  Future<MovieModel> fetchMovie(String id) async {
    try {
      final response = await _dio.get('${ApiConstants.specificMovie}/$id');

      return MovieModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load movie: ${e.message}');
    }
  }

  @override
  Future<List<MovieModel>> findMoviesByName(String name) async {
    try {
      final response = await _dio.get(
        ApiConstants.searchMovie,
        queryParameters: {'query': name},
      );
      final responseModel = MovieListResponseModel.fromJson(response.data);

      return responseModel.movies;
    } on DioException catch (e) {
      throw Exception('Failed to find movie: ${e.message}');
    }
  }
}
