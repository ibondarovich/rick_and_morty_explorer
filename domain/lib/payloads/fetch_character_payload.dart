part of 'payloads.dart';

class FetchCharactersPayload {
  final int page;          // page=X
  final String? name;      // name=rick
  final String? status;    // status=alive

  const FetchCharactersPayload({
    required this.page,
    this.name,
    this.status,
  });
}
