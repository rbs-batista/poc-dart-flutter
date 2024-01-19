import 'package:atm_architecture/commons/dtos/banknote_dto.dart';

class BanknoteModel {
  List banknotes;

  BanknoteModel({required this.banknotes});

  factory BanknoteModel.fromJson(Map<String, dynamic> json) {
    return BanknoteModel(banknotes: json['banknotes'] ?? []);
  }

  Map<String, dynamic> toJson() => {'notes': banknotes};

  BanknoteDto get toDto => BanknoteDto(banknotes: banknotes);
}
