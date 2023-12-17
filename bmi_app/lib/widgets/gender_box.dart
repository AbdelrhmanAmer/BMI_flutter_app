import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  const GenderBox({
    super.key,
    required this.gender,
    required this.isMale,
    required this.onToggle
  });
  final String gender;
  final void Function() onToggle;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onToggle,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: (gender == "Male" && isMale) || ( gender == "Female" && !isMale)
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primaryContainer.withOpacity(.2),
          ),
          child: Column(
            children: [
              Icon(
                gender == "Male"
                    ? Icons.male
                    : Icons.female,
                size: 80,
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
        ),
      ),
    );
  }
}
