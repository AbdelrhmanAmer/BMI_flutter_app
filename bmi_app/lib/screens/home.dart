import 'package:bmi_app/widgets/height_slider.dart';
import 'package:flutter/material.dart';

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
    double myWeight;
    double myHeight;
    int myAge;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.center, children: [
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
            

          ],
        ),
      ),
    );
  }
}
