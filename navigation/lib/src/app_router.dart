import 'package:auto_route/auto_route.dart';
import 'package:character_list/character_list.dart';
import 'package:detailed_character/detailed_character.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CharacterListRoute.page, initial: true),
    AutoRoute(page: DetailedCharacterRoute.page),
  ];
}
