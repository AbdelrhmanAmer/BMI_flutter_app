import 'package:flutter/material.dart';

class HeightSlider extends StatefulWidget {
  const HeightSlider({
    super.key,
    required this.onHeight
  });

  final void Function(double value) onHeight;

  @override
  State<HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  double _height = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.all(10),
              width: 310,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(.2)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${(_height).round()}',
                        style:Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      const SizedBox(width: 4,),
                      const Text(
                        'CM',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                    ],
                  ),
                  Slider(
                    value: _height,
                    onChanged: (value){
                      setState(() => _height = value);
                      widget.onHeight(value);
                    },
                    min: 10,
                    max: 210,
                    divisions: 100,
                  )
                ],
              ),
            );
  }
}
