import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameMenu extends StatefulWidget {
  final int numMode;
  GameMenu(this.numMode);

  @override
  State<GameMenu> createState() => _GameMenuState(this.numMode);
}

class _GameMenuState extends State<GameMenu> {
  final int numMode;
  _GameMenuState(this.numMode);
  static int counter = 10;
  int sum = 0;

  static var rng = Random();
  static int rastegeleOlustur() {
    return rng.nextInt(30) - 10;
  }

  bool finish() {
    if (numMode == 0) {
      if (sum >= 20 && sum < 30) {
        return true;
      } else {
        return false;
      }
    } else if (numMode == 1) {
      if (sum >= 20 && sum < 25) {
        return true;
      } else {
        return false;
      }
    } else {
      if (sum >= 20 && sum < 23) {
        return true;
      } else {
        return false;
      }
    }
  }

  void nextStep() {}

  int sayi1 = rastegeleOlustur();
  int sayi2 = rastegeleOlustur();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Focus On The Range"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsetsDirectional.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (numMode == 0) ...[
                Text(
                    "Kolay modu seçtiniz. Hedefiniz toplamı 20-30 arasında tutmaktır. 20 dahil 30 dahil değil "),
              ] else if (numMode == 1) ...[
                Text(
                    "Normal modu seçtiniz. Hedefiniz toplamı 20-25 arasında tutmaktır. 20 dahil 25 dahil değil "),
              ] else ...[
                Text(
                    "Zor modu seçtiniz. Hedefiniz toplamı 20-23 arasında tutmaktır. 20 dahil 23 dahil değil "),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          sum = sum + sayi1;
                          counter--;
                          if (counter == 0) {
                            if (finish()) {
                              victory(context);
                            } else {
                              defeat(context);
                            }
                          }
                          sayi1 = rastegeleOlustur();
                          sayi2 = rastegeleOlustur();
                        });
                      },
                      child: Text('$sayi1'),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          sum = sum + sayi2;
                          counter--;
                          if (counter == 0) {
                            if (finish()) {
                              victory(context);
                            } else {
                              defeat(context);
                            }
                          }
                          sayi1 = rastegeleOlustur();
                          sayi2 = rastegeleOlustur();
                        });
                      },
                      child: Text("$sayi2"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Sayıların Toplamı-->  $sum"),
                  Text("Kalan Hakkınız-->  $counter"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> victory(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('TEBRİKLER! BAŞARIYLA BİTİRDİNİZ'),
          content:
              const Text('Bir kez daha yenebilecek kadar cesaretli misin ;)'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Çık'),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Tekrar Oyna'),
              onPressed: () {
                sum = 0;
                counter = 10;
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> defeat(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('MAALESEF! KAYBETTİNİZ'),
          content: const Text('Bir kez daha dene yapacaksın!'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Çık'),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Tekrar Oyna'),
              onPressed: () {
                sum = 0;
                counter = 10;
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
