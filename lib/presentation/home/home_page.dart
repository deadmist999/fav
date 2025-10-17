import 'package:fav/core/theme/theme.dart';
import 'package:fav/core/ui_kit/ui_kit.dart';
import 'package:fav/presentation/home/provider/top_rated_movie_provider.dart';
import 'package:fav/presentation/movie_details/movie_details_page.dart';
import 'package:fav/presentation/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const routePath = '/';
  static const routeName = 'home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watchTheme;
    final moviesAsyncValue = ref.watch(topRatedMoviesProvider);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: FavAppBar(
        backgroundColor: theme.backgroundColor,
        pageName: 'Movie',
        actions: [
          GestureDetector(
            onTap: () => context.pushNamed(SearchPage.routeName),
            child: FavVectorImage(
              assetName: AppAssets.search,
              colorFilter: ColorFilter.mode(theme.textColor, BlendMode.srcIn),
              height: Dimensions.size24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.margin24,
              right: Dimensions.margin16,
            ),
            child: GestureDetector(
              onTap: ref.read(themeNotifierProvider.notifier).toggleTheme,
              child: FavVectorImage(
                assetName: theme.isDark ? AppAssets.moon : AppAssets.sun,
                colorFilter: ColorFilter.mode(theme.textColor, BlendMode.srcIn),
                height: Dimensions.size24,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.margin16),
        child: moviesAsyncValue.when(
          data: (movies) {
            if (movies.isEmpty) {
              return const Center(child: Text('Movies not found'));
            }

            return MovieGridBuilder(
              movies: movies,
              onTap: (movie) {
                final id = movie.id.toString();

                context.pushNamed(
                  MovieDetailsPage.routeName,
                  pathParameters: {MovieDetailsPage.queryParameterMovieId: id},
                );
              },
            );
          },
          loading: () =>
              Center(child: FavVectorImage(assetName: AppAssets.loader)),
          error: (error, stackTrace) {
            return Center(
              child: Text('Movies fetching is failed with error: $error'),
            );
          },
        ),
      ),
    );
  }
}
