import 'package:fav/core/providers/favorite_movies_provider.dart';
import 'package:fav/core/theme/theme.dart';
import 'package:fav/core/ui_kit/ui_kit.dart';
import 'package:fav/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieItem extends ConsumerWidget {
  const MovieItem({required this.movie, this.onTap, super.key});

  final Movie movie;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watchTheme;
    final favoriteMoviesAsync = ref.watch(favoriteMoviesProvider);
    final isFavorite = favoriteMoviesAsync.maybeWhen(
      data: (favoriteMovies) {
        return favoriteMovies.any((favMovie) => favMovie.id == movie.id);
      },
      orElse: () => false,
    );

    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: Dimensions.margin4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    child: Image.network(
                      movie.posterPath,
                      errorBuilder: (context, _, __) => const SizedBox.shrink(),
                    ),
                  ),
                ),
                Positioned(
                  top: Dimensions.margin24,
                  right: Dimensions.margin16,
                  child: GestureDetector(
                    onTap: () async {
                      final notifier = ref.read(
                        favoriteMoviesProvider.notifier,
                      );
                      if (isFavorite) {
                        notifier.removeFavorite(movie.id);
                      } else {
                        notifier.addFavorite(movie);
                      }
                    },
                    child: FavVectorImage(
                      assetName: isFavorite
                          ? AppAssets.starFull
                          : AppAssets.starEmpty,
                      height: Dimensions.size24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            movie.title,
            style: theme.text3,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text('Rating: ${movie.voteAverage.toInt()}', style: theme.text5),
        ],
      ),
    );
  }
}
