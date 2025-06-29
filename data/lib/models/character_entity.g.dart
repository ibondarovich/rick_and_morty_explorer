// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterEntity _$CharacterEntityFromJson(
  Map<String, dynamic> json,
) => CharacterEntity(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  status: json['status'] as String,
  species: json['species'] as String,
  type: json['type'] as String,
  gender: json['gender'] as String,
  image: json['image'] as String,
  origin: LocationEntity.fromJson(json['origin'] as Map<String, dynamic>),
  location: LocationEntity.fromJson(json['location'] as Map<String, dynamic>),
  episode: (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$CharacterEntityToJson(CharacterEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'image': instance.image,
      'origin': instance.origin,
      'location': instance.location,
      'episode': instance.episode,
    };
