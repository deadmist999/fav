import 'package:dio/dio.dart';
import 'package:fav/core/theme/src/data/theme_repository_impl.dart';
import 'package:fav/core/theme/theme.dart';
import 'package:fav/data/repositories/movie_repository_impl.dart';
import 'package:fav/data/sources/local_data_source_impl.dart';
import 'package:fav/data/sources/remote_data_source_impl.dart';
import 'package:fav/domain/repositories/i_movie_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/api_constants.dart';

final dioProvider = Provider((ref) {
  final options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: {
      'Authorization': 'Bearer ${ApiConstants.accessToken}',
      'Content-Type': 'application/json',
    },
  );
  return Dio(options);
});

final movieRepositoryProvider = Provider<IMovieRepository>((ref) {
  final remoteDataSource = ref.watch(_remoteDataSourceProvider);
  final localDataSource = ref.watch(_localDataSourceProvider);

  return MovieRepositoryImpl(remoteDataSource, localDataSource);
});

final themeRepoitoryProvider = Provider<IThemeRepository>((ref) {
  final sharedPrefs = ref.watch(sharedPrefsProvider);

  return ThemeRepositoryImpl(sharedPrefs);
});

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final _remoteDataSourceProvider = Provider<RemoteDataSourceImpl>((ref) {
  final dio = ref.watch(dioProvider);

  return RemoteDataSourceImpl(dio);
});

final _localDataSourceProvider = Provider<LocalDataSourceImpl>((ref) {
  final sharedPrefs = ref.watch(sharedPrefsProvider);

  return LocalDataSourceImpl(sharedPrefs);
});
