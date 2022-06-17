import 'dart:convert';

List<Balance> balanceFromJson(String str) =>
    List<Balance>.from(json.decode(str).map((x) => Balance.fromJson(x)));

String balanceToJson(List<Balance> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Balance {
  Balance({
    required this.gopay,
    required this.coins,
    required this.voucher,
  });

  int gopay;
  int coins;
  int voucher;

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        gopay: json["gopay"],
        coins: json["coins"],
        voucher: json["voucher"],
      );

  Map<String, dynamic> toJson() => {
        "gopay": gopay,
        "coins": coins,
        "voucher": voucher,
      };
}
