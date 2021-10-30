import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scopeProvider = ScopedProvider<int>((ref) {
  throw UnimplementedError();
});

class ScopeProviderPage extends StatelessWidget {
  const ScopeProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScopeProvider"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[buildScoped(24), buildScoped(90)],
      )),
    );
  }
}

Widget buildScoped([int? value]) {
  final consumer = Consumer(
    builder: (context, watch, child) {
      final number = watch(scopeProvider).toString();
      return Text(
        number.toString(),
        style: const TextStyle(fontSize: 62),
      );
    },
  );
  return value == null
      ? consumer
      : ProviderScope(
          child: consumer,
          overrides: [scopeProvider.overrideWithValue(value)],
        );
}
