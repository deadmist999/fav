import 'package:fav/core/utils/api_constants.dart';
import 'package:fav/data/converters/date_converter.dart';
import 'package:fav/domain/entities/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieListResponseModel {
  const MovieListResponseModel({required this.movies});

  @JsonKey(name: 'results')
  final List<MovieModel> movies;

  factory MovieListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseModelFromJson(json);
}

@JsonSerializable()
class MovieModel {
  const MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    this.posterPath,
  });

  final int id;
  final String title;
  final String overview;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'release_date')
  @DateConverter()
  final DateTime releaseDate;
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  Movie toDomain() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: '${ApiConstants.baseImageUrl}$posterPath',
      voteAverage: voteAverage,
      releaseDate: releaseDate,
    );
  }
}
