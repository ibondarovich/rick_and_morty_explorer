import 'package:json_annotation/json_annotation.dart';
import 'location_entity.dart';

part 'character_entity.g.dart';

@JsonSerializable()
class CharacterEntity {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final LocationEntity origin;
  final LocationEntity location;
  final List<String> episode;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
    required this.episode,
  });

  factory CharacterEntity.fromJson(Map<String, dynamic> json) =>
      _$CharacterEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterEntityToJson(this);
}
