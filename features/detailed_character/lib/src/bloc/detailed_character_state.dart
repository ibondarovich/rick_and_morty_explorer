part of 'detailed_character_bloc.dart';

class DetailedCharacterState {
  final bool isLoading;
  final Character? character;
  final String? errorMessage;

  const DetailedCharacterState({
    this.isLoading = false,
    this.character,
    this.errorMessage,
  });

  DetailedCharacterState copyWith({
    bool? isLoading,
    Character? character,
    String? errorMessage,
  }) {
    return DetailedCharacterState(
      isLoading: isLoading ?? this.isLoading,
      character: character ?? this.character,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory DetailedCharacterState.initial() => const DetailedCharacterState();

  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;
  bool get hasData => character != null;
}
