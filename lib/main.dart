import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jadwal_sholat_tv/components/jam.dart';
import 'package:jadwal_sholat_tv/components/jam_sholat.dart';
import 'package:jadwal_sholat_tv/components/running_text.dart';
import 'package:jadwal_sholat_tv/components/tempat_masjid.dart';
import 'package:jadwal_sholat_tv/data/api_call.dart';
import 'package:jadwal_sholat_tv/models/jadwal_sholat_model.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late List<JadwalSholatModel> jadwalSholat;
  late JadwalSholatModel? sholatSekarang = null;

  void getData() async {
    final fetchData = await fetchJadwalSholat();
    final dateNow = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final data = fetchData.firstWhere((element) => element.date == dateNow);

    setState(() {
      jadwalSholat = fetchData;
      sholatSekarang = data;
    });
  }

  void updateSholatSekarang() {
    final dateNow = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final data = jadwalSholat.firstWhere((element) => element.date == dateNow);

    setState(() {
      sholatSekarang = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      final newDateNow = DateFormat('dd-MM-yyyy').format(DateTime.now());
        if (newDateNow != sholatSekarang!.date && sholatSekarang != null) {
          updateSholatSekarang();
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/masjid.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            children: [
              StreamBuilder(
                initialData: sholatSekarang,
                stream: Stream.value(sholatSekarang),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as JadwalSholatModel;

                    return Column(
                      children: data.timings.entries
                          .map(
                            (e) => JamSholat(
                              waktu: e.key,
                              jam: e.value.replaceAll('(WIB)', ''),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              Container(
                height: double.infinity,
                constraints: const BoxConstraints(
                    minHeight: double.infinity, maxWidth: 770),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Jam(),
                        Expanded(child: TempatMasjid()),
                      ],
                    ),
                    RunningText(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
