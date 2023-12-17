import 'dart:math';

import 'package:bmi_app/screens/result.dart';
import 'package:bmi_app/widgets/height_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/counter.dart';
import '../widgets/gender_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isMale = true;
  double myWeight = 40;
  double myHeight = 150;
  double myAge = 40;
  double bmi = 0;
  @override
  Widget build(BuildContext context) {
    calcBmi(){
      setState(() {
        bmi = myWeight/pow(myHeight/100, 2);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Body Mass Index',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.secondaryContainer,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    GenderBox( gender: "Male", isMale: _isMale, onToggle: () => setState(() => _isMale = true), ),
                    const SizedBox(width: 10,),
                    GenderBox( gender: "Female", isMale: _isMale, onToggle: ()=> setState(() => _isMale = false), ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: HeightSlider(onHeight: (height)=>myHeight = height)
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Counter( title: "Weight", onChange: (value) =>myWeight = value ),
                    const SizedBox(width: 10,),
                    Counter( title: "Age", onChange: (value) =>  myAge = value ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 1),
              width: double.infinity,
              height: MediaQuery.of(context).size.height/16,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: (){
                  calcBmi();
                  print('height: $myHeight    myWeight: $myWeight ');
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx){
                      return ResultScreen(
                        result: bmi,
                        gender: _isMale? "Male" : "Female",
                        age: myAge,
                        status:
                              bmi < 18.5               ? "Underweight"
                            : bmi > 18.5 && bmi < 24.9 ? "Normal"
                            : bmi > 24.9 && bmi < 29.9 ? "Overweight"
                            : "Obese",
                      );
                    })
                  );
                },
                child: Text(
                  'Calculate',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
