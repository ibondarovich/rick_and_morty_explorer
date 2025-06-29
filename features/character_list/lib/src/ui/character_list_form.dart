import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/character_list_bloc.dart';

class CharacterListForm extends StatefulWidget {
  const CharacterListForm({super.key});

  @override
  State<CharacterListForm> createState() => _CharacterListFormState();
}

class _CharacterListFormState extends State<CharacterListForm> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  String? _selectedStatus; // null means "All"

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<CharacterListBloc>().add(FetchNextPage());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onSearchChanged(String query) {
    context.read<CharacterListBloc>().add(
      FetchCharacters(nameQuery: query, statusFilter: _selectedStatus),
    );
  }

  void _onStatusChanged(String? status) {
    setState(() {
      _selectedStatus = status == 'all' ? null : status;
    });

    context.read<CharacterListBloc>().add(
      FetchCharacters(
        nameQuery: _searchController.text,
        statusFilter: _selectedStatus,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CharacterListBloc bloc = context.read<CharacterListBloc>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: _onSearchChanged,
                ),
              ),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: _selectedStatus ?? 'all',
                items: const [
                  DropdownMenuItem(value: 'all', child: Text('All')),
                  DropdownMenuItem(value: 'alive', child: Text('Alive')),
                  DropdownMenuItem(value: 'dead', child: Text('Dead')),
                  DropdownMenuItem(value: 'unknown', child: Text('Unknown')),
                ],
                onChanged: _onStatusChanged,
                underline: const SizedBox(),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<CharacterListBloc, CharacterListState>(
            builder: (context, state) {
              if (state.status == CharacterListStatus.initial ||
                  (state.status == CharacterListStatus.loading &&
                      state.characters.isEmpty)) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.characters.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.search_off,
                        size: 64,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No characters found',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Try adjusting your search or filters',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  _searchController.clear();
                  setState(() => _selectedStatus = null);
                  bloc.add(const FetchCharacters());
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount:
                      state.hasReachedMax
                          ? state.characters.length
                          : state.characters.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= state.characters.length) {
                      return state.status == CharacterListStatus.loading
                          ? const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(child: CircularProgressIndicator()),
                          )
                          : const SizedBox.shrink();
                    }

                    final character = state.characters[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(character.image),
                      ),
                      title: Text(character.name),
                      subtitle: Text(
                        '${character.status} - ${character.species}',
                      ),
                      onTap:
                          () => bloc.add(OpenDetailedCharacter(character.id)),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
