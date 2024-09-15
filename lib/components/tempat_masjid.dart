import 'package:flutter/material.dart';

class TempatMasjid extends StatelessWidget {
  const TempatMasjid({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 6;

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.center,
      height: height,
      color: const Color(0xFF26367C).withOpacity(0.9),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "MASJID AL-MUHAJIRIN",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
          ),
          Text(
            "Dondong RT 02 / RW 06, Wonosari, Ngaliyan, Semarang",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),
          )
        ],
      ),
    );
  }
}
