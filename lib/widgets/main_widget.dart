import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constants/app_constants.dart';
import 'package:ortalama_hesaplama/helper/data_helper.dart';
import 'package:ortalama_hesaplama/model/ders.dart';
import 'package:ortalama_hesaplama/widgets/ders_listesi.dart';
import 'package:ortalama_hesaplama/widgets/harf_dropdown_widget.dart';
import 'package:ortalama_hesaplama/widgets/kredi_dropdown_widget.dart';
import 'package:ortalama_hesaplama/widgets/ortlama_goster.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double secilenHarfDeger = 4;
  double secilenKrediDeger = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Sabitler.anaRenk),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: [
            Expanded(
              flex: 2,
              child: _buildForm(),
            ),
            Expanded(
              child: OrtalamaGoster(
                dersSayisi: DataHelper.tumEklenenDersler.length,
                ortlama: DataHelper.ortalamaHesapla(),
              ),
            ),
          ]),
          Expanded(
            child: DersListesi(
              onDismiss: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Padding(
                padding: Sabitler.yatayPadding8,
                child: HarfDropdown(
                  onHarfSecildi: (harf) {
                    secilenHarfDeger = harf;
                  },
                ),
              )),
              Expanded(
                  child: Padding(
                padding: Sabitler.yatayPadding8,
                child: KrediDropdown(onKrediSecildi: (kredi) {
                  secilenKrediDeger = kredi;
                }),
              )),
              IconButton(
                  iconSize: 30,
                  color: Sabitler.anaRenk,
                  onPressed: _dersEkleveOrtalamaHesapla,
                  icon: const Icon(Icons.arrow_forward_ios_rounded)),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders Adı Giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: 'Ders Girin',
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
        ad: girilenDersAdi,
        harfDegeri: secilenHarfDeger,
        krediDegeri: secilenKrediDeger,
      );
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
