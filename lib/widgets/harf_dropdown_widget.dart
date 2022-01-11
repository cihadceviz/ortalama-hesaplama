import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constants/app_constants.dart';
import 'package:ortalama_hesaplama/helper/data_helper.dart';

class HarfDropdown extends StatefulWidget {
  final Function onHarfSecildi;
  HarfDropdown({required this.onHarfSecildi, Key? key}) : super(key: key);

  @override
  _HarfDropdownState createState() => _HarfDropdownState();
}

class _HarfDropdownState extends State<HarfDropdown> {
  double secilenDeger = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100,
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
          elevation: 16,
          iconEnabledColor: Sabitler.anaRenk.shade700,
          iconDisabledColor: Sabitler.anaRenk.shade200,
          underline: Container(),
          onChanged: (selectedValue) {
            setState(() {
              secilenDeger = selectedValue!;
              widget.onHarfSecildi(secilenDeger);
            });
          },
          value: secilenDeger,
          items: DataHelper.tumDersler()),
    );
  }
}
