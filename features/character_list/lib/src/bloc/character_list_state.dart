part of 'character_list_bloc.dart';

enum CharacterListStatus { initial, loading, success, failure }

class CharacterListState {
  final CharacterListStatus status;
  final List<Character> characters;
  final bool hasReachedMax;
  final String? errorMessage;

  const CharacterListState({
    this.status = CharacterListStatus.initial,
    this.characters = const [],
    this.hasReachedMax = false,
    this.errorMessage,
  });

  CharacterListState copyWith({
    CharacterListStatus? status,
    List<Character>? characters,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return CharacterListState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
