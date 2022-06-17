import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokped/models/balance.dart';

class BalanceProvider extends ChangeNotifier {
  Future<List<Balance>?> getBalance() async {
    Uri url = Uri.parse(
        'https://8a2ede6e-4628-4111-9f9f-ef1158748fa7.mock.pstmn.io/balance');
    var result = await http.get(url);

    print(result.statusCode);
    print(result.body);

    try {
      if (result.statusCode == 200) {
        List<Balance> _balance = balanceFromJson(result.body);
        return _balance;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
