// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:detailed_character/src/ui/detailed_character_screen.dart'
    as _i1;
import 'package:flutter/material.dart' as _i3;

/// generated route for
/// [_i1.DetailedCharacterScreen]
class DetailedCharacterRoute
    extends _i2.PageRouteInfo<DetailedCharacterRouteArgs> {
  DetailedCharacterRoute({
    required int characterId,
    _i3.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
         DetailedCharacterRoute.name,
         args: DetailedCharacterRouteArgs(characterId: characterId, key: key),
         initialChildren: children,
       );

  static const String name = 'DetailedCharacterRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailedCharacterRouteArgs>();
      return _i1.DetailedCharacterScreen(
        characterId: args.characterId,
        key: args.key,
      );
    },
  );
}

class DetailedCharacterRouteArgs {
  const DetailedCharacterRouteArgs({required this.characterId, this.key});

  final int characterId;

  final _i3.Key? key;

  @override
  String toString() {
    return 'DetailedCharacterRouteArgs{characterId: $characterId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailedCharacterRouteArgs) return false;
    return characterId == other.characterId && key == other.key;
  }

  @override
  int get hashCode => characterId.hashCode ^ key.hashCode;
}
