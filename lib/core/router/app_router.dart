import 'package:fav/presentation/home/home_page.dart';
import 'package:fav/presentation/movie_details/movie_details_page.dart';
import 'package:fav/presentation/search/search_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: HomePage.routePath,
        name: HomePage.routeName,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '${MovieDetailsPage.routePath}/:id',
        name: MovieDetailsPage.routeName,
        builder: (context, state) {
          final movieId = state.pathParameters['id'] ?? '0';

          return MovieDetailsPage(movieId: movieId);
        },
      ),
      GoRoute(
        path: SearchPage.routePath,
        name: SearchPage.routeName,
        builder: (context, state) => const SearchPage(),
      ),
    ],
  );
});
