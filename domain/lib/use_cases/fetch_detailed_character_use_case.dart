part of 'use_cases.dart';

final class FetchCharacterByIdUseCase extends FutureUsecase<int, Character> {
  final CharacterRepository _repository;

  const FetchCharacterByIdUseCase({required CharacterRepository repository})
    : _repository = repository;

  @override
  Future<Character> execute(int id) async {
    return _repository.fetchCharacterById(id);
  }
}
