import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  const GenderBox({
    super.key,
    required this.gender,
    required this.icon,
    required this.isMale
  });

  final String gender;
  final IconData icon;
  final bool isMale;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 150,
      height: 170,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: isMale
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primaryContainer.withOpacity(.2),
      ),
      child: Column(
        children: [
          Icon(
            icon, size: 80,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          const SizedBox(height: 10,),
          Text(
            gender,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold,
              fontSize: 23
            ),
          )
        ],
      ),

    );
  }
}
