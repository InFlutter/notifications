import 'dart:convert';

import 'package:http/http.dart' as http;

class GetDailyMotivation {
  static Future<String> everyDayMotivation() async {
    final url = Uri.parse("https://type.fit/api/quotes");
    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data.toString();
      } else {
        return "No Motivation";
      }
    } catch (e) {
      return e.toString();
    }
  }
}
