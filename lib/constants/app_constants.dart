import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const anaRenk = Colors.indigo;
  static const baslikText = 'Ortalama Hesapla';
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, color: anaRenk, fontWeight: FontWeight.w900);
  static final TextStyle ortlamaGosterBodyStyle = GoogleFonts.quicksand(
      fontSize: 16, color: anaRenk, fontWeight: FontWeight.w600);
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 55, color: anaRenk, fontWeight: FontWeight.w800);
  static BorderRadius borderRadius = BorderRadius.circular(16);
  static const dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
