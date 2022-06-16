import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tokped/models/balance.dart';

class BalanceService {
  String baseUrl = 'url';

  Future<Balance> getBalance() async {
    var url = Uri.parse('$baseUrl/balance');

    var response = await http.get(url);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      Balance balance = Balance.fromJson(data);
      return balance;
    } else {
      throw Exception('Gagal get balance!');
    }
  }
}
