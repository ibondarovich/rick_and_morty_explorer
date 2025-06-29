import 'package:core/core.dart';
import '../models/models.dart';

class CharacterProvider {
  final Dio _dio;

  CharacterProvider(this._dio);

  Future<List<CharacterEntity>> fetchCharacters({
    required int page,
    String? name,
    String? status,
  }) async {
    final response = await _dio.get(
      '/character',
      queryParameters: {
        'page': page,
        if (name != null && name.isNotEmpty) 'name': name,
        if (status != null && status.isNotEmpty) 'status': status.toLowerCase(),
      },
    );

    final results = response.data['results'] as List;
    return results
        .map((json) => CharacterEntity.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<CharacterEntity> fetchCharacterById(int id) async {
    final response = await _dio.get('/character/$id');
    return CharacterEntity.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<CharacterEntity>> getCharactersByIds(List<int> ids) async {
    final idString = ids.join(',');
    final response = await _dio.get('/character/$idString');
    
    final results = response.data is List ? response.data : [response.data];
    return (results as List)
        .map((json) => CharacterEntity.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
