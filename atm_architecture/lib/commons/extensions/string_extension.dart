import 'dart:convert';

extension JsonSerialization on String {
  Map<String, dynamic> deserialize() => jsonDecode(this);
}
