import 'package:fav/core/providers/data_providers.dart';
import 'package:fav/core/theme/src/state/theme_notifier.dart';
import 'package:fav/core/theme/src/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en_EN', null);

  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(sharedPrefs)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final currentThemeMode = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      theme: lightTheme.theme,
      darkTheme: darkTheme.theme,
      themeMode: currentThemeMode,
      routerConfig: router,
    );
  }
}
