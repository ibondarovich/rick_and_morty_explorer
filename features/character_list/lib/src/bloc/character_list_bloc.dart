import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/payloads/payloads.dart';
import 'package:navigation/navigation.dart';

part 'character_list_event.dart';

part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  final AppRouter _appRouter;
  final FetchCharactersUseCase fetchCharactersUseCase;

  CharacterListBloc({
    required this.fetchCharactersUseCase,
    required AppRouter appRouter,
  }) : _appRouter = appRouter,
       super(const CharacterListState()) {
    on<FetchCharacters>(_onFetchCharacters);
    on<FetchNextPage>(_onFetchNextPage);
    on<OpenDetailedCharacter>(_onOpenDetailedCharacter);

    add(const FetchCharacters());
  }

  int _currentPage = 1;
  String? _currentNameQuery;
  String? _currentStatusFilter;
  static const _itemsPerPage = 20;

  Future<void> _onFetchCharacters(
    FetchCharacters event,
    Emitter<CharacterListState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: CharacterListStatus.loading,
          characters: [],
          hasReachedMax: false,
        ),
      );

      _currentPage = 1;
      _currentNameQuery = event.nameQuery;
      _currentStatusFilter = event.statusFilter;

      final payload = FetchCharactersPayload(
        page: _currentPage,
        name: _currentNameQuery,
        status: _currentStatusFilter,
      );

      final characters = await fetchCharactersUseCase.execute(payload);

      emit(
        state.copyWith(
          status: CharacterListStatus.success,
          characters: characters,
          hasReachedMax: characters.length < _itemsPerPage,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: CharacterListStatus.failure));

      print(e);
    }
  }

  Future<void> _onFetchNextPage(
    FetchNextPage event,
    Emitter<CharacterListState> emit,
  ) async {
    if (state.status == CharacterListStatus.loading || state.hasReachedMax) {
      return;
    }

    try {
      emit(state.copyWith(status: CharacterListStatus.loading));

      final nextPage = _currentPage + 1;
      final payload = FetchCharactersPayload(
        page: nextPage,
        name: _currentNameQuery,
        status: _currentStatusFilter,
      );

      final characters = await fetchCharactersUseCase.execute(payload);

      if (characters.isEmpty) {
        emit(state.copyWith(hasReachedMax: true));
      } else {
        _currentPage = nextPage;
        emit(
          state.copyWith(
            status: CharacterListStatus.success,
            characters: List.of(state.characters)..addAll(characters),
            hasReachedMax: characters.length < _itemsPerPage,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: CharacterListStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onOpenDetailedCharacter(
    OpenDetailedCharacter event,
    Emitter<CharacterListState> emit,
  ) async {
    _appRouter.push(DetailedCharacterRoute(characterId: event.id));
  }
}
