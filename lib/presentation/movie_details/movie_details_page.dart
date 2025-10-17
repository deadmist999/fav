import 'package:fav/core/extensions/date_to_string_extension.dart';
import 'package:fav/core/providers/favorite_movies_provider.dart';
import 'package:fav/core/theme/theme.dart';
import 'package:fav/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider/movie_details_provider.dart';

part 'widgets/image_part.dart';
part 'widgets/info_part.dart';

class MovieDetailsPage extends ConsumerWidget {
  const MovieDetailsPage({required this.movieId, super.key});

  static const queryParameterMovieId = 'id';
  static const routePath = '/movie';
  static const routeName = 'movieDetails';

  final String movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watchTheme;
    final movieDetailsAsync = ref.watch(movieDetailsProvider(movieId));
    final favoriteMoviesAsync = ref.watch(favoriteMoviesProvider);

    return Scaffold(
      appBar: FavAppBar(
        backgroundColor: theme.backgroundColor,
        pageName: movieDetailsAsync.value?.title,
        actions: const [SizedBox(width: Dimensions.size48)],
      ),
      body: movieDetailsAsync.when(
        data: (movie) {
          final notifier = ref.read(favoriteMoviesProvider.notifier);
          final isFavorite = favoriteMoviesAsync.maybeWhen(
            data: (favoriteMovies) {
              return favoriteMovies.any((favMovie) => favMovie.id == movie.id);
            },
            orElse: () => false,
          );

          return Column(
            spacing: Dimensions.margin16,
            children: [
              // Image
              _ImagePart(
                imagePath: movie.posterPath,
                rating: movie.voteAverage.toInt(),
              ),

              // Description and release date
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.margin16,
                ),
                child: _InfoPart(
                  overview: movie.overview,
                  releaseDate: movie.releaseDate,
                ),
              ),

              // Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.margin16,
                ),
                child: FavMainButton(
                  text: isFavorite
                      ? 'Remove from favorites'
                      : 'Add to favorites',
                  onPressed: () {
                    isFavorite
                        ? notifier.removeFavorite(movie.id)
                        : notifier.addFavorite(movie);
                  },
                  foregroundColor: isFavorite
                      ? theme.secondaryButtonTextColor
                      : theme.primaryButtonTextColor,
                  backgroundColor: isFavorite
                      ? Colors.transparent
                      : theme.primaryButtonColor,
                  borderColor: isFavorite
                      ? theme.secondaryButtonTextColor
                      : null,
                ),
              ),
            ],
          );
        },
        loading: () =>
            Center(child: FavVectorImage(assetName: AppAssets.loader)),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
