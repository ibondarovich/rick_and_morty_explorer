import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';

import '../bloc/character_list_bloc.dart';
import 'character_list_form.dart';

@RoutePage()
class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterListBloc>(
      create:
          (context) => CharacterListBloc(
            fetchCharactersUseCase: appLocator.get<FetchCharactersUseCase>(),
            appRouter: appLocator.get<AppRouter>(),
          ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Rick and Morty')),
        body: const CharacterListForm(),
      ),
    );
  }
}
