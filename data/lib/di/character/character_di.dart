import 'package:core/core.dart';
import 'package:data/mappers/mappers.dart';
import 'package:data/providers/character_provider.dart';
import 'package:data/repositories/character_repository_impl.dart';
import 'package:domain/domain.dart';

class CharacterDependencies {
  static void setup() {
    _setupProviders();
    _setupRepositories();
  }

  static void _setupProviders() {
    appLocator.registerLazySingleton<CharacterProvider>(
      () => CharacterProvider(appLocator<Dio>()),
    );
  }

  static void _setupRepositories() {
    appLocator.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(
        characterProvider: appLocator<CharacterProvider>(),
        characterMapper: CharacterMapper(),
      ),
    );
  }
}
