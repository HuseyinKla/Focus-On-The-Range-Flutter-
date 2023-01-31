import 'package:flutter/material.dart';
import 'package:focus_on_the_range/GameMenu.dart';

class MainMenu extends StatelessWidget {
  late int mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Focus On The Range",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  "OYUN AÇIKLAMASI: Oyunun belirli zorlukları vardır. Herbir zorluğun ise belirli sayı aralığı vardır.\nAmacınız ise verilecek olan sayıları toplayarak bu belirlenen aralıkta sayıyı sona ulaştırmaktır. Yani hakkınız bittiğinde sayıların toplamı belirlediğiniz aralık içinde olmalıdır."),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(bottom: 70),
              child: Text(
                  "Kolay modun aralığı 20-30. 20 dahil 30 dahil değil\nOrta modun aralığı 20-25. 20 dahil 25 dahil değil\nZor modun aralığı 20-23. 20 dahil 23 dahil değil"),
            ),
            Text("Modlar"),
            Container(
              margin: EdgeInsetsDirectional.only(bottom: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      mode = 0;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GameMenu(mode)));
                    },
                    child: Text("KOLAY"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      mode = 1;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GameMenu(mode)));
                    },
                    child: Text("NORMAL"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      mode = 2;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GameMenu(mode)));
                    },
                    child: Text("ZOR"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
