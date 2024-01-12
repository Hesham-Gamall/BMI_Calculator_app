import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  double result;
  final bool isMale;


  BmiResultScreen({
    required this.result,
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isMale?Color(0xff204891):Color(0xffef65a3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI is:',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '${result.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),


            if(result <=  18.5) ...[
              Text(
                'Underweight',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ]else if (result >= 18.6 && result <= 24.9 ) ...[
              Text(
                'Normal weight',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ]else if (result >= 25 && result <= 29.9 ) ...[
              Text(
                'Overweight',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ]else if (result >= 30) ...[
              Text(
                'Obesity',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],




            SizedBox(
              height: 100,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_circle_left_outlined,),
              color: Colors.white,
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }
}
