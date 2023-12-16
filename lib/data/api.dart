import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:takehomeproject/models/nobel_prizess.dart';

class Api {
  static Future<List<NobelPrize>> fetchNobelPrizes() async {
    const url = 'https://irfangul92.github.io/index.json';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['nobelPrizes'];
      final result =
          data.map<NobelPrize>((e) => NobelPrize.fromJson(e)).toList();
      return result;
    } else {
      throw Exception('Failed to load Nobel Prizes');
    }
  }
}
