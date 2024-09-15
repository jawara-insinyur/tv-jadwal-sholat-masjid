class Urls {
  static String baseUrl(String city, String country, String method,
          String latitude, String longitude) =>
      'http://api.aladhan.com/v1/calendarByCity/2024/8?city=$city&country=$country&method=$method&latitude=$latitude&longitude=$longitude';
}
