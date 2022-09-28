import 'package:flutter/material.dart';
import 'package:practice_provider/provider/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    final sliderprovider = Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(builder: (context, value, child) {
              return Slider(
                value: value.sliderval,
                onChanged: ((val) {
                  value.setval(val);
                  setState(() {});
                }),
              );
            }),
            Consumer<SliderProvider>(builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 100,
                    width: 150,
                    color: Colors.green.withOpacity(value.value),
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Container 1",
                        )),
                  )),
                  Expanded(
                      child: Container(
                    height: 100,
                    width: 150,
                    color: Colors.red.withOpacity(value.value),
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text("Container 2")),
                  ))
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
