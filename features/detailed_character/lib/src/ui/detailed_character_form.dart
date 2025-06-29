import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/detailed_character_bloc.dart';

class DetailedCharacterForm extends StatelessWidget {
  const DetailedCharacterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<DetailedCharacterBloc, DetailedCharacterState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final character = state.character;
        if (character == null) {
          return const Center(child: Text('Character not found.'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  character.image,
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              Text(character.name, style: textTheme.headlineSmall),
              const SizedBox(height: 12),
              _InfoRow(label: 'Status', value: character.status),
              _InfoRow(label: 'Species', value: character.species),
              _InfoRow(
                label: 'Type',
                value: character.type.isNotEmpty ? character.type : '—',
              ),
              _InfoRow(label: 'Gender', value: character.gender),
              _InfoRow(label: 'Origin', value: character.origin.name),
              _InfoRow(label: 'Location', value: character.location.name),
              _InfoRow(
                label: 'Episode count',
                value: character.episode.length.toString(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: style?.copyWith(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, style: style)),
        ],
      ),
    );
  }
}
