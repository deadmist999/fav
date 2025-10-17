// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponseModel _$MovieListResponseModelFromJson(
  Map<String, dynamic> json,
) => MovieListResponseModel(
  movies: (json['results'] as List<dynamic>)
      .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);


MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  overview: json['overview'] as String,
  voteAverage: (json['vote_average'] as num).toDouble(),
  releaseDate: const DateConverter().fromJson(json['release_date'] as String),
  posterPath: json['poster_path'] as String?,
);

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'release_date': const DateConverter().toJson(instance.releaseDate),
      'poster_path': instance.posterPath,
    };
