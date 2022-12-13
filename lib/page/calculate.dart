import 'dart:math';

import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  String? temp;
  String? temp2;
  double suhu = 0;

  final TextEditingController inputSuhu = TextEditingController();

  final TextEditingController aSgt = TextEditingController();
  final TextEditingController tSgt = TextEditingController();

  final TextEditingController sPsg = TextEditingController();

  final TextEditingController rLkr = TextEditingController();

  final TextEditingController pPp = TextEditingController();
  final TextEditingController lePp = TextEditingController();

  final TextEditingController tJg = TextEditingController();
  final TextEditingController aJg = TextEditingController();

  final TextEditingController d1Bk = TextEditingController();
  final TextEditingController d2Bk = TextEditingController();
  double lsgt = 0, ksgt = 0;
  double lpsg = 0, kpsg = 0;
  double llkr = 0, klkr = 0;
  double lPp = 0, kPp = 0;
  double lJg = 0, kJg = 0;
  double lBk = 0, kBk = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          //Segitiga
          Card(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: aSgt,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Input Ruas Segitiga')),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) {
                        setState(() {
                          lsgt = double.parse(aSgt.text) *
                              double.parse(tSgt.text) /
                              2;
                          ksgt = double.parse(aSgt.text) * 3;
                        });
                      },
                      controller: tSgt,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Input Tinggi Segitiga')),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        lsgt = double.parse(aSgt.text) *
                            double.parse(tSgt.text) /
                            2;
                        ksgt = double.parse(aSgt.text) * 3;
                      });
                    },
                    child: const Text('Hitung Segitiga')),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Luas Segitiga $lsgt \n\n Keliling Segitiga $ksgt",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //Persegi
          Card(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) {
                        setState(() {
                          lpsg = pow(double.parse(sPsg.text), 2).toDouble();
                          kpsg = double.parse(sPsg.text) * 4;
                        });
                      },
                      controller: sPsg,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Input Sisi Persegi')),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        lpsg = pow(double.parse(sPsg.text), 2).toDouble();
                        kpsg = double.parse(sPsg.text) * 4;
                      });
                    },
                    child: const Text('Hitung Luas Persegi')),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Luas Persegi $lpsg \n\n Keliling Persegi $kpsg",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //Lingkaran
          Card(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) {
                        setState(() {
                          llkr = pow(double.parse(rLkr.text), 2) * 3.14;
                          klkr = double.parse(rLkr.text) * 2 * 3.14;
                        });
                      },
                      controller: rLkr,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Input Ruas Lingkaran')),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        llkr = pow(double.parse(rLkr.text), 2) * 3.14;
                        klkr = double.parse(rLkr.text) * 2 * 3.14;
                      });
                    },
                    child: const Text('Hitung Lingkaran')),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Luas Lingkaran $llkr \n\n Keliling Lingkaran $klkr",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //Persegi Panjang
          Card(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: pPp,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Input Panjang Persegi Panjang')),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) {
                        setState(() {
                          lPp =
                              double.parse(lePp.text) * double.parse(pPp.text);
                          kPp = (double.parse(lePp.text) +
                                  double.parse(pPp.text)) *
                              2;
                        });
                      },
                      controller: lePp,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Input Lebar Persegi Panjang')),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        lPp = double.parse(lePp.text) * double.parse(pPp.text);
                        kPp =
                            (double.parse(lePp.text) + double.parse(pPp.text)) *
                                2;
                      });
                    },
                    child: const Text('Hitung Persegi Panjang')),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Luas Persegi Panjang $lPp \n\n Keliling Persegi Panjang $kPp",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //Jajar Genjang
          Card(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: aJg,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Input Alas Jajargenjang')),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) {
                        setState(() {
                          lJg = double.parse(aJg.text) * double.parse(tJg.text);
                          kJg = (double.parse(aJg.text) +
                                  double.parse(tJg.text)) *
                              2;
                        });
                      },
                      controller: tJg,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Input Tinggi Jajargenjang')),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        lJg = double.parse(aJg.text) * double.parse(tJg.text);
                        kJg =
                            (double.parse(aJg.text) + double.parse(tJg.text)) *
                                2;
                      });
                    },
                    child: const Text('Hitung Jajargenjang')),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Luas Jajargenjang $lJg \n\n Keliling Jajargenjang $kJg",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //Belah Ketupat
          Card(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: d1Bk,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Input diagonal 1 Belah Ketupat')),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) {
                        setState(() {
                          lBk = 0.5 *
                              double.parse(d1Bk.text) *
                              double.parse(d2Bk.text);
                          kBk = sqrt(
                              pow(double.parse(d1Bk.text), 2).toDouble() +
                                  pow(double.parse(d2Bk.text), 2).toDouble());
                        });
                      },
                      controller: d2Bk,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Input diagonal 2 Belah Ketupat')),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        lBk = pow(double.parse(d1Bk.text), 2).toDouble();
                        kBk = double.parse(d1Bk.text) * 4;
                      });
                    },
                    child: const Text('Hitung Luas Belah Ketupat')),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Luas Belah Ketupat $lBk \n\n Keliling Belah Ketupat $kBk",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Text('Pilih input suhu : '),
                  RadioListTile(
                    title: const Text('Celcius'),
                    value: "Celcius",
                    groupValue: temp,
                    onChanged: (value) {
                      setState(() {
                        temp = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Fahrenheit'),
                    value: "Fahrenheit",
                    groupValue: temp,
                    onChanged: (value) {
                      setState(() {
                        temp = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Reamur'),
                    value: "Reamur",
                    groupValue: temp,
                    onChanged: (value) {
                      setState(() {
                        temp = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Kelvin'),
                    value: "Kelvin",
                    groupValue: temp,
                    onChanged: (value) {
                      setState(() {
                        temp = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                        controller: inputSuhu,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Input suhu dalam satuan $temp')),
                  ),
                  const Text('Pilih output suhu : '),
                  RadioListTile(
                    title: const Text('Celcius'),
                    value: "Celcius",
                    groupValue: temp2,
                    onChanged: (value) {
                      setState(() {
                        temp2 = value;
                        switch (temp) {
                          case 'Celcius':
                            suhu = double.parse(inputSuhu.text);
                            break;
                          case 'Fahrenheit':
                            suhu =
                                (double.parse(inputSuhu.text) - 32) * (5 / 9);
                            break;
                          case 'Reamur':
                            suhu = double.parse(inputSuhu.text) / 0.8;
                            break;
                          case 'Kelvin':
                            suhu = double.parse(inputSuhu.text) - 273.15;
                            break;
                          default:
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Fahrenheit'),
                    value: "Fahrenheit",
                    groupValue: temp2,
                    onChanged: (value) {
                      setState(() {
                        temp2 = value;
                        switch (temp) {
                          case 'Celcius':
                            suhu = double.parse(inputSuhu.text) * (9 / 5) + 32;
                            break;
                          case 'Fahrenheit':
                            suhu = double.parse(inputSuhu.text);
                            break;
                          case 'Reamur':
                            suhu = (double.parse(inputSuhu.text) * 2.25) + 32;
                            break;
                          case 'Kelvin':
                            suhu = (double.parse(inputSuhu.text) - 273.15) *
                                    (9 / 5) +
                                32;
                            break;
                          default:
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Reamur'),
                    value: "Reamur",
                    groupValue: temp2,
                    onChanged: (value) {
                      setState(() {
                        temp2 = value;
                        switch (temp) {
                          case 'Celcius':
                            suhu = double.parse(inputSuhu.text) * 4 / 5;
                            break;
                          case 'Fahrenheit':
                            suhu = 4 / 9 * (double.parse(inputSuhu.text) - 32);

                            break;
                          case 'Reamur':
                            suhu = double.parse(inputSuhu.text);
                            break;
                          case 'Kelvin':
                            suhu = 4 / 5 * (double.parse(inputSuhu.text) - 273);
                            break;
                          default:
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Kelvin'),
                    value: "Kelvin",
                    groupValue: temp2,
                    onChanged: (value) {
                      setState(() {
                        temp2 = value;
                        switch (temp) {
                          case 'Celcius':
                            suhu = double.parse(inputSuhu.text) + 273.15;

                            break;
                          case 'Fahrenheit':
                            suhu =
                                (double.parse(inputSuhu.text) - 32) * (5 / 9) +
                                    273.15;

                            break;
                          case 'Reamur':
                            suhu =
                                (double.parse(inputSuhu.text) / 0.8) + 273.15;

                            break;
                          case 'Kelvin':
                            suhu = double.parse(inputSuhu.text);
                            break;
                          default:
                        }
                      });
                    },
                  ),
                  Text('Hasil : $suhu derajat $temp2'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
