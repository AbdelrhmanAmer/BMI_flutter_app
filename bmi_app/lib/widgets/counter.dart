import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({
    super.key,
    required this.title,
    required this.onChange,
  });

  final String title;
  final void Function(double value) onChange;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  double counter = 40;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer.withOpacity(.2),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '${counter.round()}',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: '${widget.title}1',
                  foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: (){
                    setState(()=>counter++);
                    widget.onChange(counter);
                  },
                  mini: true,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10,),
                FloatingActionButton(
                  heroTag: '${widget.title}2',
                  foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: (){
                    if(counter > 1) {
                      setState(()=>counter--);
                      widget.onChange(counter);
                    }else{
                      return;
                    }
                  },
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
              ],
            )
      
          ],
        ),
      ),
    );
  }
}
