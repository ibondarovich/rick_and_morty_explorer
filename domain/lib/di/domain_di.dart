import 'character_di.dart';

class DomainDependencies {
  static void initDependencies() {
    CharacterDependencies.setup();
  }
}
