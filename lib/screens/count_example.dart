import 'package:flutter/material.dart';
import 'package:practice_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExapmle extends StatefulWidget {
  const CountExapmle({super.key});

  @override
  State<CountExapmle> createState() => _CountExapmleState();
}

class _CountExapmleState extends State<CountExapmle> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print(countProvider.count.toString());

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Counter")),
      body: Center(
        child: Consumer<CountProvider>(builder: ((context, value, child) {
          return Text(value.count.toString());
        })),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (() {
            countProvider.setcount();
          }),
          child: const Icon(Icons.add)),
    );
  }
}
