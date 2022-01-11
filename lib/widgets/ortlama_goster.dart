import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constants/app_constants.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortlama;
  final int dersSayisi;
  const OrtalamaGoster(
      {required this.dersSayisi, required this.ortlama, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders Girildi' : 'Ders Seçiniz',
          style: Sabitler.ortlamaGosterBodyStyle,
        ),
        Text(
          ortlama >= 0 ? ortlama.toStringAsFixed(2) : '0.0',
          style: Sabitler.ortalamaStyle,
        ),
        Text(
          "Ortalama",
          style: Sabitler.ortlamaGosterBodyStyle,
        )
      ],
    );
  }
}
