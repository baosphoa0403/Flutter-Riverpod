import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Car {
  final int speed;
  final int doors;

  const Car({this.speed = 120, this.doors = 2});

  Car copyWith({
    int? speed,
    int? doors,
  }) {
    return Car(
      speed: speed ?? this.speed,
      doors: doors ?? this.doors,
    );
  }
}

class CartNotifier extends StateNotifier<Car> {
  CartNotifier() : super(const Car());
  void setDoors(int doors) {
    final newState = state.copyWith(doors: doors);
    state = newState;
  }

  void increaseSpeed() {
    final speed = state.speed + 5;
    final newState = state.copyWith(speed: speed);
    state = newState;
  }

  void hitBrake() {
    final speed = max(0, state.speed - 30);
    final newState = state.copyWith(speed: speed);
    state = newState;
  }
}

final stateNotifierProvider = StateNotifierProvider<CartNotifier, Car>((ref) {
  return CartNotifier();
});

class StateNotifierPage extends ConsumerWidget {
  const StateNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    Car car = watch(stateNotifierProvider);
    CartNotifier cartNotifier = watch(stateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("StateNotifierPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Speed: ${car.speed}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Door: ${car.doors}",
              style: const TextStyle(fontSize: 20),
            ),
            _buildButton(watch),
            Slider(
                value: car.doors.toDouble(),
                max: 100,
                onChanged: (value) {
                  cartNotifier.setDoors(value.toInt());
                })
          ],
        ),
      ),
    );
  }

  Widget _buildButton(watch) {
    CartNotifier cartNotifier = watch(stateNotifierProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
            onPressed: () {
              // context.read(carProvider).increase();
              cartNotifier.increaseSpeed();
            },
            child: const Text("Increase +5")),
        ElevatedButton(
            onPressed: () {
              // context.read(carProvider).hitBreak();
              cartNotifier.hitBrake();
            },
            child: const Text("Increase +30"))
      ],
    );
  }
}
