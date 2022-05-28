import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmi});
  final String bmi;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: keyBackground,
      appBar: AppBar(
        backgroundColor: keyBackground,
        title: Text("BMI Calculator", style: kBodyTextStyle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your body mass index is:', style: kResultTextStyle,),
            Text(bmi, style: kBMITextStyle,)
          ],
        ),
      ),
    );
  }
}