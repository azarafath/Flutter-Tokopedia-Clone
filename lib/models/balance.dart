class Balance {
  late int gopay;
  late int coins;
  late int voucher;

  Balance({
    required this.gopay,
    required this.coins,
    required this.voucher,
  });

  Balance.fromJson(Map<String, dynamic> json) {
    gopay = json['gopay'];
    coins = json['coins'];
    voucher = json['voucher'];
  }
}
