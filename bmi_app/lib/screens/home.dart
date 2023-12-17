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
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    double myWeight = 40;
    double myHeight = 150;
    double myAge = 40;
    double bmi = 0;

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
        child: Container(
          padding: const EdgeInsets.all(16),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () =>setState(() => isMale = isMale ? isMale : !isMale),
                      child: GenderBox(gender: "Male", icon: Icons.male, isMale: isMale, )
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                      onTap: () =>setState(() => isMale = isMale ? !isMale : isMale),
                      child: GenderBox(gender: "Female", icon: Icons.female, isMale: !isMale,)),
                ],
              ),
              HeightSlider(onHeight: (height)=>myHeight = height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Counter(
                    title: "Weight",
                    onChange: (value) =>myWeight = value
                  ),
                  const SizedBox(width: 10,),
                  Counter(
                    title: "Age",
                    onChange: (value) =>  myAge = value
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                width: 310,
                height: 45,
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
                          gender: isMale?"Male":"Female",
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
      ),
    );
  }
}
