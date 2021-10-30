import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarNotifier extends ChangeNotifier {
  int _speed = 150;
  void increase() {
    _speed += 5;
    notifyListeners(); // notify cho tất cả nơi đang xài biết manual
  }

  void hitBreak() {
    _speed = max(0, _speed - 30);
    notifyListeners();
  }

  @override
  void dispose() {}
}

final carProvider = ChangeNotifierProvider<CarNotifier>((ref) {
  return CarNotifier();
});

class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final car = watch(carProvider);
    print(car._speed);
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChangeNotifierPage"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Speed Code: ${car._speed}",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 8,
            ),
            _buildButton(context, car)
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, CarNotifier car) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
            onPressed: () {
              context.read(carProvider).increase();
            },
            child: const Text("Increase +5")),
        ElevatedButton(
            onPressed: () {
              context.read(carProvider).hitBreak();
            },
            child: const Text("Increase +30"))
      ],
    );
  }
}
