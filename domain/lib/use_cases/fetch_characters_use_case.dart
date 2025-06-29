part of 'use_cases.dart';

final class FetchCharactersUseCase
    extends FutureUsecase<FetchCharactersPayload, List<Character>> {
  final CharacterRepository _repository;

  const FetchCharactersUseCase({
    required CharacterRepository repository,
  }) : _repository = repository;

  @override
  Future<List<Character>> execute(FetchCharactersPayload payload) async {
    return _repository.fetchCharacters(payload: payload);
  }
}
