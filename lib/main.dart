import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int sum = 0;
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();

  void clearInputs() {
    setState(() {
      add1Controller.clear();
      add2Controller.clear();
      sum = 0;
    });
  }

  void performOperation(String operation) {
    setState(() {
      int firstAddNum = int.tryParse(add1Controller.text) ?? 0;
      int secondAddNum = int.tryParse(add2Controller.text) ?? 0;

      switch (operation) {
        case '+':
          sum = firstAddNum + secondAddNum;
          break;
        case '-':
          sum = firstAddNum - secondAddNum;
          break;
        case '*':
          sum = firstAddNum * secondAddNum;
          break;
        case '/':
          sum = secondAddNum != 0 ? firstAddNum ~/ secondAddNum : 0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PAMPLONA Unit 5 Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Addition Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: add1Controller,
                    decoration: const InputDecoration(labelText: "First Number"),
                  ),
                ),
                const SizedBox(width: 10), 
                const Text(" + "),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: add2Controller,
                    decoration: const InputDecoration(labelText: "Second Number"),
                  ),
                ),
                const SizedBox(width: 10),
                Text('= $sum'),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () => performOperation('+'),
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            // Subtraction Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: add1Controller,
                    decoration: const InputDecoration(labelText: "First Number"),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" - "),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: add2Controller,
                    decoration: const InputDecoration(labelText: "Second Number"),
                  ),
                ),
                const SizedBox(width: 10),
                Text('= $sum'),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () => performOperation('-'),
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            // Multiplication Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: add1Controller,
                    decoration: const InputDecoration(labelText: "First Number"),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" * "),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: add2Controller,
                    decoration: const InputDecoration(labelText: "Second Number"),
                  ),
                ),
                const SizedBox(width: 10),
                Text('= $sum'),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () => performOperation('*'),
                  mini: true,
                  child: const Icon(Icons.clear),
                ),
              ],
            ),
            // Division Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: add1Controller,
                    decoration: const InputDecoration(labelText: "First Number"),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" / "),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: add2Controller,
                    decoration: const InputDecoration(labelText: "Second Number"),
                  ),
                ),
                const SizedBox(width: 10),
                Text('= $sum'),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () => performOperation('/'),
                  mini: true,
                  child: const Icon(Icons.percent),
                ),
              ],
            ),
          ],
        ),
      ),

      // Clear Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: clearInputs,
        label: const Text("Clear"),
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
