import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:jadwal_sholat_tv/constants/url.dart';
import 'package:jadwal_sholat_tv/models/jadwal_sholat_model.dart';

Future<List<JadwalSholatModel>> fetchJadwalSholat() async {
  try {
    String city = dotenv.env['APP_CITY']!;
    String country = dotenv.env['APP_COUNTRY']!;
    String method = dotenv.env['APP_METHOD']!;
    String latitude = dotenv.env['APP_LATITUDE']!;
    String longitude = dotenv.env['APP_LONGITUDE']!;

    final response = await http.get(
        Uri.parse(Urls.baseUrl(city, country, method, latitude, longitude)));
    final parsedJson = jsonDecode(response.body)['data'] as List;

    final List<JadwalSholatModel> jadwalSholat =
        parsedJson.map((e) => JadwalSholatModel.fromJson(e)).toList();

    return jadwalSholat;
  } catch (err) {
    throw Exception(err);
  }
}
