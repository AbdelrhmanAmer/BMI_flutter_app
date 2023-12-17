import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.result,
    required this.status,
    required this.gender,
    required this.age,
  });

  final double age;
  final double result;
  final String gender;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.secondaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.onPrimaryContainer,
                Theme.of(context).colorScheme.onBackground.withOpacity(.5),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 90),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ResultInfoTile(label: 'Gender', value: gender),
              ResultInfoTile(label: 'Healthiness', value: status),
              ResultInfoTile(label: 'Age', value: '${age.round()}'),
              ResultInfoTile(label: 'Result', value: '${result.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultInfoTile extends StatelessWidget {
  final String label;
  final String value;

  const ResultInfoTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.secondaryContainer,
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),
      ),
      subtitle: StyledText(value, fontSize: 18),
    );
  }
}

class StyledText extends StatelessWidget {
  final String text;
  final double fontSize;

  const StyledText(this.text, {required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
