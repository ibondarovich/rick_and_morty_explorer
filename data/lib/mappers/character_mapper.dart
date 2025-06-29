part of 'mappers.dart';

class CharacterMapper {
  /// Converts a [CharacterEntity] (data layer) to a [Character] (domain layer)
  static Character fromEntity(CharacterEntity entity) {
    return Character(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      species: entity.species,
      type: entity.type,
      gender: entity.gender,
      image: entity.image,
      origin: LocationMapper.fromEntity(entity.origin),
      location: LocationMapper.fromEntity(entity.location),
      episode: List<String>.from(entity.episode),
    );
  }

  /// Converts a [Character] (domain layer) to a [CharacterEntity] (data layer)
  static CharacterEntity toEntity(Character character) {
    return CharacterEntity(
      id: character.id,
      name: character.name,
      status: character.status,
      species: character.species,
      type: character.type,
      gender: character.gender,
      image: character.image,
      origin: LocationMapper.toEntity(character.origin),
      location: LocationMapper.toEntity(character.location),
      episode: List<String>.from(character.episode),
    );
  }

  /// Converts a list of [CharacterEntity] to a list of [Character]
  static List<Character> toDomainList(List<CharacterEntity> entities) {
    return entities.map((entity) => fromEntity(entity)).toList();
  }

  /// Converts a list of [Character] to a list of [CharacterEntity]
  static List<CharacterEntity> toEntityList(List<Character> characters) {
    return characters.map((character) => toEntity(character)).toList();
  }
}
