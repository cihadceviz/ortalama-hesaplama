import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constants/app_constants.dart';
import 'package:ortalama_hesaplama/helper/data_helper.dart';

class KrediDropdown extends StatefulWidget {
  final Function onKrediSecildi;
  KrediDropdown({required this.onKrediSecildi, Key? key}) : super(key: key);

  @override
  _KrediDropdownState createState() => _KrediDropdownState();
}

class _KrediDropdownState extends State<KrediDropdown> {
  double secilenKrediDeger = 1;

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
              secilenKrediDeger = selectedValue!;
              widget.onKrediSecildi(secilenKrediDeger);
            });
          },
          value: secilenKrediDeger,
          items: DataHelper.tumDerslerinKredileri()),
    );
  }
}
