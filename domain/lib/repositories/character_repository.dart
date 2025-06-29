part of repositories;
/// Repository interface for character-related data operations
abstract class CharacterRepository {
  /// Fetches a list of characters based on the provided filters and pagination
  ///
  /// [page] The page number for pagination
  /// [name] Optional name filter
  /// [status] Optional status filter (e.g., 'alive', 'dead', 'unknown')
  /// Returns a list of [Character] objects
  /// Throws [Exception] if the operation fails
  Future<List<Character>> fetchCharacters({
    required FetchCharactersPayload payload,
  });

  /// Fetches a single character by ID
  ///
  /// [id] The ID of the character to fetch
  /// Returns a single [Character] object
  /// Throws [Exception] if the character is not found or operation fails
  Future<Character> fetchCharacterById(int id);
  //
  // /// Fetches multiple characters by their IDs
  // ///
  // /// [ids] List of character IDs to fetch
  // /// Returns a list of [Character] objects
  // /// Throws [Exception] if the operation fails
  // Future<List<Character>> getCharactersByIds(List<int> ids);
  //
  // /// Searches for characters by name
  // ///
  // /// [query] The search query string
  // /// [page] The page number for pagination
  // /// Returns a list of matching [Character] objects
  // /// Throws [Exception] if the operation fails
  // Future<List<Character>> searchCharacters({
  //   required String query,
  //   int page = 1,
  // });
  //
  // /// Fetches characters filtered by status
  // ///
  // /// [status] The status to filter by (e.g., 'alive', 'dead', 'unknown')
  // /// [page] The page number for pagination
  // /// Returns a list of filtered [Character] objects
  // /// Throws [Exception] if the operation fails
  // Future<List<Character>> getCharactersByStatus({
  //   required String status,
  //   int page = 1,
  // });
}
