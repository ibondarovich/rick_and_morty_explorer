part of 'mappers.dart';

class LocationMapper {
  /// Converts a [LocationEntity] (data layer) to a [Location] (domain layer)
  static Location fromEntity(LocationEntity entity) {
    return Location(
      name: entity.name,
      url: entity.url,
    );
  }

  /// Converts a [Location] (domain layer) to a [LocationEntity] (data layer)
  static LocationEntity toEntity(Location location) {
    return LocationEntity(
      name: location.name,
      url: location.url,
    );
  }

  /// Converts a list of [LocationEntity] to a list of [Location]
  static List<Location> toDomainList(List<LocationEntity> entities) {
    return entities.map((entity) => fromEntity(entity)).toList();
  }

  /// Converts a list of [Location] to a list of [LocationEntity]
  static List<LocationEntity> toEntityList(List<Location> locations) {
    return locations.map((location) => toEntity(location)).toList();
  }
}
