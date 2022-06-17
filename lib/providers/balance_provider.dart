import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokped/models/balance.dart';

class BalanceProvider extends ChangeNotifier {
  Future<List<Balance>?> getBalance() async {
    Uri url = Uri.parse(
        'https://6b7888dd-18ab-498f-b06d-b404748a04d3.mock.pstmn.io/balance');

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
