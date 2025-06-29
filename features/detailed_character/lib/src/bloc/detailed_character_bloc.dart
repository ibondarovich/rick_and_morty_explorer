import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

part 'detailed_character_event.dart';

part 'detailed_character_state.dart';

class DetailedCharacterBloc
    extends Bloc<DetailedCharacterEvent, DetailedCharacterState> {
  final FetchCharacterByIdUseCase _fetchCharacterByIdUseCase;
  final int _characterId;

  DetailedCharacterBloc({
    required FetchCharacterByIdUseCase fetchCharacterByIdUseCase,
    required int characterId,
  }) : _fetchCharacterByIdUseCase = fetchCharacterByIdUseCase,
       _characterId = characterId,
       super(DetailedCharacterState.initial()) {
    on<Init>(_onInit);

    add(Init());
  }

  Future<void> _onInit(Init event, Emitter<DetailedCharacterState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final character = await _fetchCharacterByIdUseCase.execute(_characterId);
      emit(state.copyWith(isLoading: false, character: character));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
