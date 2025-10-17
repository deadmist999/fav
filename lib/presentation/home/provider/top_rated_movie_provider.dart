import 'package:fav/core/providers/data_providers.dart';
import 'package:fav/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topRatedMoviesProvider = FutureProvider.autoDispose<List<Movie>>((
  ref,
) async {
  final movieRepository = ref.watch(movieRepositoryProvider);

  return movieRepository.fetchTopRatedMovies();
});
