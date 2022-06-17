import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokped/models/balance.dart';

class BalanceProvider extends ChangeNotifier {
  Future<List<Balance>?> getBalance() async {
    Uri url = Uri.parse(
        'https://4c1fa8f1-6852-44c7-a30d-4e6bb94c5649.mock.pstmn.io/balance');

    try {
      var result = await http.get(url);

      print(result.statusCode);
      print(result.body);
      if (result.statusCode == 200) {
        List<Balance> _balance = balanceFromJson(result.body);
        return _balance;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
