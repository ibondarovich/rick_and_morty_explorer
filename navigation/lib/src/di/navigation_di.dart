import 'package:core/core.dart';
import 'package:navigation/src/app_router.dart';

class NavigationDependencies {
  static void setup() {
    // Register AppRouter as a lazy singleton
    appLocator.registerLazySingleton<AppRouter>(
      () => AppRouter(),
    );
  }
}
