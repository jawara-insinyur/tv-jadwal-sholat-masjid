import 'package:flutter/material.dart';
import 'package:jadwal_sholat_tv/constants/color.dart';

class JamSholat extends StatefulWidget {
  final String waktu;
  final String jam;

  const JamSholat({
    super.key,
    required this.waktu,
    required this.jam,
  });

  @override
  State<JamSholat> createState() => _JamSholatState();
}

class _JamSholatState extends State<JamSholat> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 6;

    return Container(
      color: Color(colorForJadwal(widget.waktu)),
      width: 190,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.waktu,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.jam,
            style: const TextStyle(
                fontSize: 40, fontWeight: FontWeight.w600, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
