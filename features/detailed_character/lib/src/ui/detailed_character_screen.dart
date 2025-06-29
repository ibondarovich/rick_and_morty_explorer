import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/detailed_character_bloc.dart';
import 'detailed_character_form.dart';

@RoutePage()
class DetailedCharacterScreen extends StatelessWidget {
  final int characterId;

  const DetailedCharacterScreen({required this.characterId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailedCharacterBloc>(
      create:
          (context) => DetailedCharacterBloc(
            fetchCharacterByIdUseCase:
                appLocator.get<FetchCharacterByIdUseCase>(),
            characterId: characterId,
          ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Rick and Morty')),
        body: const DetailedCharacterForm(),
      ),
    );
  }
}
