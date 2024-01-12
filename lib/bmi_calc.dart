import 'dart:math';

import 'package:bmi_app/bmi_result.dart';
import 'package:bmi_app/height_cm.dart';
import 'package:bmi_app/weight_kg.dart';
import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class BmiCalcScreen extends StatelessWidget {

  final bool isMale;

  late int height = 150;

  late int weight = 70;

  BmiCalcScreen({
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment(0.55, 1),
        child: Container(
            width: 100,
            child: FloatingActionButton(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('CALC',style: TextStyle(fontSize: 20,color: Colors.white),),
                  Icon(Icons.arrow_forward_ios,color: Colors.white,),
                ],
              ),
                onPressed: (){
                  double result = weight / pow(height / 100, 2);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BmiResultScreen(
                    result: result,
                    isMale: isMale,
                  ),),);
                },
            ),
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new,
                                color: isMale ? Color(0xff204891) : Color(0xffef65a3),
                                size: 27,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                'BMI',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: isMale ? Color(0xff204891) : Color(0xffef65a3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Center(
                        child: Text(
                          '${isMale ? 'Male' : 'Female'}',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Icon(
                          isMale ? Icons.male : Icons.female,
                          size: 100,
                          color: isMale? Color(0xff204891) : Color(0xffef65a3),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Text(
                          'Weight (KG)',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      Expanded(
                        child: Center(
                          child: WheelPicker(
                            selectedIndexColor: isMale ? Color(0xff204891) : Color(0xffef65a3),
                            builder: (context, index) {
                              return WeightKG(weight: index);
                            },
                            onIndexChanged: (index) {
                              print('on index $index');
                              weight = index;
                            },
                            style: WheelPickerStyle(
                              itemExtent: 50,
                              size: double.infinity,
                              diameterRatio: 2,
                              surroundingOpacity: 0.4,
                              squeeze: 0.7,
                            ),
                            itemCount: 301,
                            looping: false,
                            enableTap: false,
                            initialIndex: 70,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: isMale ? Color(0xff204891) : Color(0xffef65a3),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  children: [
                    Text('Height',style: TextStyle(fontSize: 20,color: Colors.white),),
                    Text('(CM)',style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 40,),
                    Expanded(
                      child: Center(
                        child: WheelPicker(
                          selectedIndexColor: isMale ? Color(0xff204891) : Color(0xffef65a3),
                          builder: (context, index) {
                            return HeightCM(height: index);
                          },
                          onIndexChanged: (index) {
                            print('on index $index');
                            height = index;
                          },
                          style: WheelPickerStyle(
                            magnification: 1.5,
                            surroundingOpacity: 0.7,
                            itemExtent: 50,
                            size: double.infinity,
                            diameterRatio: 3.3,
                            squeeze: 0.6,
                          ),
                          itemCount: 301,
                          looping: false,
                          enableTap: false,
                          initialIndex: 150,
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
