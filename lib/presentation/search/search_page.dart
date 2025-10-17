import 'dart:async';

import 'package:fav/core/theme/theme.dart';
import 'package:fav/core/ui_kit/ui_kit.dart';
import 'package:fav/presentation/movie_details/movie_details_page.dart';
import 'package:fav/presentation/search/provider/search_movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'widgets/search_field.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  static const routePath = '/search';
  static const routeName = 'search';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watchTheme;
    final searchQuery = ref.watch(searchQueryProvider);
    final searchResult = ref.watch(searchMovieProvider(searchQuery));

    return Scaffold(
      appBar: FavAppBar(
        backgroundColor: theme.backgroundColor,
        pageName: 'Search',
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.margin16),
        child: Column(
          spacing: Dimensions.margin16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SearchField(),

            if (searchQuery.isNotEmpty) ...[
              Builder(
                builder: (context) {
                  final movieAmount = searchResult.maybeWhen(
                    data: (data) => data.length,
                    orElse: () => 0,
                  );
                  return Text(
                    'Search result ($movieAmount)',
                    style: theme.text2,
                  );
                },
              ),

              searchResult.maybeWhen(
                data: (data) {
                  if (data.isEmpty) {
                    return Center(
                      heightFactor: 2,
                      child: FavVectorImage(
                        assetName: AppAssets.noFound,
                        colorFilter: ColorFilter.mode(
                          theme.textColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: MovieGridBuilder(
                      movies: data,
                      onTap: (movie) {
                        final id = movie.id.toString();

                        context.pushNamed(
                          MovieDetailsPage.routeName,
                          pathParameters: {
                            MovieDetailsPage.queryParameterMovieId: id,
                          },
                        );
                      },
                    ),
                  );
                },
                orElse: SizedBox.new,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
