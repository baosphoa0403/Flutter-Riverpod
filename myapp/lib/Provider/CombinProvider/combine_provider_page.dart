import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityProvider = Provider<String>((ref) {
  return "Munich2";
});
Future<int> fetchWeather(String city) async {
  await Future.delayed(const Duration(seconds: 10));
  return city == "Munich" ? 20 : 15;
}

final futureProvider = FutureProvider.autoDispose<int>((ref) {
  final city = ref.watch(cityProvider);
  return fetchWeather(city);
});

class ComBineProvider extends ConsumerWidget {
  const ComBineProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final future = watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Combining Providers"),
      ),
      body: Center(
        child: future.when(
          data: (value) => Text(value.toString()),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text("Eror: $error"),
        ),
      ),
    );
  }
}
