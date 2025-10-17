import 'package:fav/core/providers/data_providers.dart';
import 'package:fav/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider.autoDispose<String>((ref) => '');

final searchMovieProvider =
    AutoDisposeFutureProviderFamily<List<Movie>, String>((ref, name) async {
      final name = ref.watch(searchQueryProvider);
      if (name.isEmpty) return const [];

      final movieRepository = ref.watch(movieRepositoryProvider);

      return movieRepository.findMoviesByName(name);
    });
