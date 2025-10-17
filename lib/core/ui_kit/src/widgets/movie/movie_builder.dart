import 'package:fav/core/ui_kit/src/constants/dimensions.dart';
import 'package:fav/core/ui_kit/src/widgets/movie/movie_item.dart';
import 'package:fav/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieGridBuilder extends StatelessWidget {
  const MovieGridBuilder({required this.movies, this.onTap, super.key});

  final List<Movie> movies;
  final ValueChanged<Movie>? onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Dimensions.margin16,
        mainAxisSpacing: Dimensions.margin16,
        childAspectRatio: 0.55,
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];

        return MovieItem(movie: movie, onTap: () => onTap?.call(movie));
      },
    );
  }
}
