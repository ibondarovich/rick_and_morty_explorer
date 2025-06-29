import 'package:domain/domain.dart';
import 'package:domain/payloads/payloads.dart';

import '../mappers/mappers.dart';
import '../models/character_entity.dart';
import '../providers/character_provider.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterProvider _characterProvider;
  final CharacterMapper _characterMapper;

  const CharacterRepositoryImpl({
    required CharacterProvider characterProvider,
    required CharacterMapper characterMapper,
  }) : _characterProvider = characterProvider,
       _characterMapper = characterMapper;

  @override
  Future<List<Character>> fetchCharacters({
    required FetchCharactersPayload payload,
  }) async {
    final List<CharacterEntity> response = await _characterProvider
        .fetchCharacters(
          page: payload.page,
          name: payload.name,
          status: payload.status,
        );

    return CharacterMapper.toDomainList(response);
  }

  @override
  Future<Character> fetchCharacterById(int id) async {
    final CharacterEntity response = await _characterProvider
        .fetchCharacterById(id);

    return CharacterMapper.fromEntity(response);
  }

  //
  // @override
  // Future<List<CharacterModel>> fetchCharactersByIds(List<int> ids) async {
  //   final response = await _provider.getCharactersByIds(ids);
  //   final data = response.data;
  //
  //   if (data is List) {
  //     return data.map((json) => CharacterModel.fromJson(json)).toList();
  //   } else {
  //     return [CharacterModel.fromJson(data)];
  //   }
  // }
}
