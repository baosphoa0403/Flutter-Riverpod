import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<int> fetchWeather() async {
  await Future.delayed(const Duration(seconds: 10));
  return 20;
}

final futureProvider = FutureProvider.autoDispose<int>((ref) {
  return fetchWeather();
});

class FlutterProviderPage extends ConsumerWidget {
  const FlutterProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final provider = watch(futureProvider);
    print(provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterProviderPage"),
      ),
      body: Center(
        child: provider.when(
          data: (value) => Text(
            value.toString(),
            style: const TextStyle(fontSize: 62),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text(error.toString()),
        ),
      ),
    );
  }
}
