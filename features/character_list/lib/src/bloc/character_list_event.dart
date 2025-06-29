part of 'character_list_bloc.dart';

abstract class CharacterListEvent {
  const CharacterListEvent();
}

class FetchCharacters extends CharacterListEvent {
  final String? nameQuery;
  final String? statusFilter;

  const FetchCharacters({this.nameQuery, this.statusFilter});
}

class FetchNextPage extends CharacterListEvent {}

class OpenDetailedCharacter extends CharacterListEvent {
  final int id;

  const OpenDetailedCharacter(this.id);
}
