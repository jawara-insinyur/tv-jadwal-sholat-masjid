class JadwalSholatModel {
  final Map<String, String> timings;
  final String date;

  JadwalSholatModel({
    required this.timings,
    required this.date,
  });

  factory JadwalSholatModel.fromJson(Map<String, dynamic> json) {
    return JadwalSholatModel(
      timings: {
        'Shubuh': json['timings']['Fajr'],
        'Syuruq': json['timings']['Sunrise'],
        'Dzuhur': json['timings']['Dhuhr'],
        'Ashar': json['timings']['Asr'],
        'Maghrib': json['timings']['Maghrib'],
        'Isya': json['timings']['Isha'],
      },
      date: json['date']['gregorian']['date'],
    );
  }
}
