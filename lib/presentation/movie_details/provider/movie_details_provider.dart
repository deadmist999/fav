import 'package:fav/core/providers/data_providers.dart';
import 'package:fav/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDetailsProvider = FutureProvider.family.autoDispose<Movie, String>((
  ref,
  movieId,
) async {
  final movieRepository = ref.watch(movieRepositoryProvider);

  return movieRepository.fetchMovie(movieId);
});
