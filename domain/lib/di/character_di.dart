import 'package:core/core.dart';

import '../repositories/repositories.dart';
import '../use_cases/use_cases.dart';

class CharacterDependencies {
  static void setup() {
    appLocator.registerFactory<FetchCharactersUseCase>(
      () =>
          FetchCharactersUseCase(repository: appLocator<CharacterRepository>()),
    );

    appLocator.registerFactory<FetchCharacterByIdUseCase>(
      () => FetchCharacterByIdUseCase(
        repository: appLocator<CharacterRepository>(),
      ),
    );
  }
}
