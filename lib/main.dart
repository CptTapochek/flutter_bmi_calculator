import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const InputPage(),
    );
  }
}

enum Gender {
  male, female, empty
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.empty;
  var age = 20;
  var height = 150;
  var weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: keyBackground,
      appBar: AppBar(
        backgroundColor: keyBackground,
        title: Text("BMI Calculator", style: kBodyTextStyle),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.mars, size: 65),
                          SizedBox(height: 15,),
                          Text('MALE', style: kBodyTextStyle,)
                        ],),
                      onTap: (){},
                      // onTap: () => {
                      //   setState(() {
                      //     gender = Gender.male;
                      //   })
                      // },
                      color: gender == Gender.male ? kActiveCardColor : kInactiveCardColour,
                    )
                ),
                Expanded(
                    child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.venus, size: 65),
                          SizedBox(height: 15,),
                          Text('FEMALE', style: kBodyTextStyle,)
                        ],),
                      onTap: (){},
                      // onTap: () => {
                      //   setState(() {
                      //     gender = Gender.female;
                      //   })
                      // },
                      color: gender == Gender.female ? kActiveCardColor : kInactiveCardColour,
                    )
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(color: kInactiveCardColour, onTap: (){},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('HEIGHT', style: kBodyTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(height.toString(), style: kNumberTextStyle,),
                              SizedBox(width: 7,),
                              SizedBox(
                                height: 35  ,
                                child: Text('cm', style: kBodyTextStyle,),
                              )
                            ],
                          ),
                          Slider(
                            min: 130, max: 240,
                            value: height.toDouble(),
                            activeColor: kBottomContainerColor,
                            onChanged: (value){
                              setState(() {
                                height = value.round();
                              });
                           }),
                        ],
                      ),)
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT', style: kBodyTextStyle,),
                          SizedBox(height: 10,),
                          Text(weight.toString(), style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.plus),
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                  width: 50.0, height: 50.0
                                ),
                                fillColor: Color(0xFF222747),
                                padding: EdgeInsets.all(5),
                              ),
                              SizedBox(width: 20,),
                              RawMaterialButton(
                                onPressed: (){
                                  setState(() {
                                    weight > 20 ? weight-- : weight;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.minus),
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                    width: 50.0, height: 50.0
                                ),
                                fillColor: Color(0xFF222747),
                                padding: EdgeInsets.all(5),
                              ),
                            ],
                          )
                        ],
                      ),
                      color: kInactiveCardColour,
                      onTap: (){},
                    )
                ),
                Expanded(
                    child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: kBodyTextStyle,),
                          SizedBox(height: 10,),
                          Text(age.toString(), style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.plus),
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                    width: 50.0, height: 50.0
                                ),
                                fillColor: Color(0xFF222747),
                                padding: EdgeInsets.all(5),
                              ),
                              SizedBox(width: 20,),
                              RawMaterialButton(
                                onPressed: (){
                                  setState(() {
                                    age > 16 ? age-- : age;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.minus),
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                    width: 50.0, height: 50.0
                                ),
                                fillColor: Color(0xFF222747),
                                padding: EdgeInsets.all(5),
                              ),
                            ],
                          )
                        ],
                      ),
                      color: kInactiveCardColour,
                      onTap: (){},
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              final heightSquared = height / 100;
              final result = weight / (heightSquared * heightSquared);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(bmi: result.round().toString()))
              );
            },
            child: Container(
              height: 65,
              color: kBottomContainerColor,
              child: Center(child: Text('CALCULATE MY BMI', style: kLargeButtonTextStyle,)),
            ),
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;
  const ReusableCard({
    Key? key, required this.onTap, required this.color, required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        //child: ,
      ),
    );
  }
}
