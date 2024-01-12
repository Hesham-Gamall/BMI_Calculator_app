import 'package:bmi_app/bmi_calc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenderSelectionScreen extends StatelessWidget {
  const GenderSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BmiCalcScreen(isMale: true,)));
              },
              child: Container(
                color: Color(0xff204891),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.male,
                      size: 110,
                      color: Colors.white,
                    ),
                    Text(
                      'Male',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BmiCalcScreen(isMale: false,)));
              },
              child: Container(
                color: Color(0xffef65a3),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.female,
                      size: 110,
                      color: Colors.white,
                    ),
                    Text(
                      'Female',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
