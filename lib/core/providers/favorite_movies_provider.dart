import 'dart:async';

import 'package:fav/core/providers/data_providers.dart';
import 'package:fav/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMoviesProvider extends AsyncNotifier<List<Movie>> {
  @override
  FutureOr<List<Movie>> build() async {
    final repository = ref.watch(movieRepositoryProvider);

    return repository.getCachedFavoriteMovies();
  }

  Future<void> addFavorite(Movie movie) async {
    final repository = ref.read(movieRepositoryProvider);

    state = AsyncValue.data([...?state.value, movie]);

    await repository.cacheFavoriteMovie(movie);
  }

  Future<void> removeFavorite(int movieId) async {
    final repository = ref.read(movieRepositoryProvider);

    final previousState = state.valueOrNull ?? [];

    state = AsyncValue.data(
      previousState.where((movie) => movie.id != movieId).toList(),
    );

    await repository.removeFavoriteMovie(movieId);
  }
}

final favoriteMoviesProvider =
    AsyncNotifierProvider<FavoriteMoviesProvider, List<Movie>>(
      () => FavoriteMoviesProvider(),
    );
