import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<String> fetchValue() async {
  await Future.delayed(const Duration(milliseconds: 400));
  return "State will be disposed";
}

final futureProvider = FutureProvider.autoDispose<String>((ref) async {
  return fetchValue();
});

class AutoDisposeWidgetModifierPage extends ConsumerWidget {
  const AutoDisposeWidgetModifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final future = watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("AutoDispose modifier"),
      ),
      body: Center(
        child: future.when(
          data: (value) => Text(
            value,
            style: const TextStyle(fontSize: 32),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text("error $error"),
          ),
        ),
      ),
    );
  }
}
