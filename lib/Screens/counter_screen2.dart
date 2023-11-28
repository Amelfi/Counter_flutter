import 'package:flutter/material.dart';

class CounterScreen2 extends StatefulWidget {
  const CounterScreen2({super.key});

  @override
  State<CounterScreen2> createState() => _CounterScreen2State();
}

class _CounterScreen2State extends State<CounterScreen2> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void refresh() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigoAccent,
        elevation: 5.0,

        shadowColor: Colors.indigoAccent
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Cantidad de Clicks',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('$counter',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingAction(
          increaseFn: increase, decreaseFn: decrease, refreshtFn: refresh),
    );
  }
}

class CustomFloatingAction extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function refreshtFn;
  const CustomFloatingAction({
    super.key, 
    required this.increaseFn, 
    required this.decreaseFn, 
    required this.refreshtFn
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          backgroundColor: Colors.indigoAccent,
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () => refreshtFn(),
          backgroundColor: Colors.indigoAccent,
          child: const Icon(Icons.refresh),
        ),
        FloatingActionButton(
          onPressed: () => increaseFn(),
          backgroundColor: Colors.indigoAccent,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
