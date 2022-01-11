import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constants/app_constants.dart';
import 'package:ortalama_hesaplama/helper/data_helper.dart';
import 'package:ortalama_hesaplama/model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> TumDersler = DataHelper.tumEklenenDersler;
    return TumDersler.length > 0
        ? ListView.builder(
            itemCount: TumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(TumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text((TumDersler[index].harfDegeri *
                                TumDersler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          '${TumDersler[index].krediDegeri} Kredi, Not Değeri ${TumDersler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            })
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                child: Text(
                  "Lütfen Ders Giriniz",
                  style: Sabitler.baslikStyle,
                ),
              ),
            ),
          );
  }
}
