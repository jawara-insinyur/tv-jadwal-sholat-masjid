import 'package:flutter/material.dart';
import 'package:jadwal_sholat_tv/constants/text.dart';
import 'package:marquee/marquee.dart';

class RunningText extends StatelessWidget {
  const RunningText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 60,
      alignment: Alignment.center,
      color: const Color(0xFF0D1630).withOpacity(0.7),
      child: Marquee(
        text:
            '"Siapa yang menjaga sholat, maka dia mendapatkan petunjuk, cahaya, dan keselamatan pada hari kiamat. Dan, siapa yang tidak menjaga sholat, maka dia tidak akan mendapatkan petunjuk, cahaya, dan keselamatan. Kemudian, pada hari kiamat nanti, dia akan dikumpulkan bersama dengan Qarun, Firaun, Haman, dan Ubay bin Khalaf." - HR. Ahmad. "Sholat adalah tiang agama, barang siapa mendirikannya, maka sungguh ia telah menegakkan agama (Islam) itu dan barangsiapa meninggalkannya maka sungguh ia telah merobohkan agama (Islam) itu." "Diantara shalat lima waktu, antara Jum’at yang satu dengan Jum’at yang lain, antara Ramadhan yang satu dengan Ramadhan yang lain, maka akan menghapuskan dosa-dosa di antara keduanya selama seseorang menjauhi dosa-dosa besar." - HR.Muslim no.233. "Bacalah kitab (Al-Quran) yang diturunkan kepadamu (Muhammad) dan berdoalah. Sesungguhnya shalat menghindarkan dari (perbuatan) yang keji dan munkar. Dan (tahulah) mengingat Allah (sholat) lebih utama (prioritasnya dibandingkan ibadah lainnya). Tuhan tahu apa yang kamu lakukan." - QS.Al-Ankabut:45. "Suruhlah anak kalian sholat ketika berumur 7 tahun dan pukul mereka ketika berusia 10 tahun, jika mereka meninggalkan salat." - HR. Abu Dawud. "Barangsiapa yang mengerjakan shalat Isya berjamaah, maka dia mendapat (pahala seolah-olah dia) berdiri setengah malam. Dan barangsiapa shalat Isya dan Subuh berjamaah, maka dia mendapat (pahala seolah-olah dia) menafkahkan seluruh berdiri di malam hari (sholat)." - Jami`At-Tirmidzi: 221. "Yang pertama kali akan dihisab dari seseorang pada hari kiamat adalah sholat. Jika sholatnya baik, akan baik pula seluruh amalnya. Jika sholatnya rusak akan rusak pula seluruh amal perbuatannya." - Thabrani',
        style: runningTextStyle,
        scrollAxis: Axis.horizontal,
        startPadding: 10,
      ),
    );
  }
}
