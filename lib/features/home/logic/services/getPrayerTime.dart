import 'dart:convert';

import 'package:http/http.dart' as http;

class PrayerTimesService {
  Future<Map<String, dynamic>> getPrayerTimes() async {
    http.Response response = await http.get(Uri.parse(
        "http://api.aladhan.com/v1/calendar/2024/12?latitude=30.033&longitude=31.233"));

    if (response.statusCode == 200) {
      Map<String, dynamic> fetchedData = jsonDecode(response.body);

      Map<String, dynamic> timings = fetchedData['data'][0]['timings'];
      Map<String, String> prayerTimes = timings.map((key, value) => MapEntry(key, value.toString()));

      String date = fetchedData['data'][0]['date']['readable'];

      String location = fetchedData['data'][0]['meta']['timezone'];

      
      return {
        'timings': prayerTimes,
        'date': date,
        'location': location,
      };
    } else {
      throw Exception("Failed to load prayer times: ${response.statusCode}");
    }
  }
}
