import 'dart:convert';

extension ConvertMapToJson on Map {
  String serialize() => jsonEncode(this);
}
