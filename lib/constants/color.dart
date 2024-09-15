final List<Map<String, int>> jadwalColor = [
  {'Shubuh': 0xFF137AAE},
  {'Syuruq': 0xFF1AB57C},
  {'Dzuhur': 0xFF689BD8},
  {'Ashar': 0xFFE9B84B},
  {'Maghrib': 0xFFAC75D8},
  {'Isya': 0xFF15226B},
];

int colorForJadwal(String key) {
  for (final map in jadwalColor) {
    if (map.containsKey(key)) {
      return map[key]!;
    }
  }
  return 0;
}
