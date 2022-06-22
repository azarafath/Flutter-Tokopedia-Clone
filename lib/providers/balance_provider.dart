import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokped/models/balance.dart';

class BalanceProvider extends ChangeNotifier {
  Future<List<Balance>?> getBalance() async {
    Uri url = Uri.parse(
        'https://22197666-6c45-4e01-b17e-6899fd195b43.mock.pstmn.io/balance');

    try {
      var result = await http.get(url);
      if (result.statusCode == 200) {
        List<Balance> _balance = balanceFromJson(result.body);
        return _balance;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
