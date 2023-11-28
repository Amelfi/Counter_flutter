import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  //Properties
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CounterScreen',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        elevation: 5.0,
        shadowColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Counter',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          CustomFloatingActionButton(increaseFn: increase, decreaseFn: decrease, resetFn: reset,),
    );
  }
  
}

class CustomFloatingActionButton extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;
  const CustomFloatingActionButton({
    super.key,
    required this.increaseFn,
    required this.decreaseFn, required this.resetFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          backgroundColor: Colors.indigo,
          child: const Icon(Icons.remove),
        ),
        const SizedBox(
          width: 20,
        ),
        FloatingActionButton(
          onPressed: () => resetFn(),
          backgroundColor: Colors.indigo,
          child: const Icon(Icons.restore),
        ),
        const SizedBox(
          width: 20,
        ),
        FloatingActionButton(
          onPressed: () => increaseFn(),
          backgroundColor: Colors.indigo,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

}
