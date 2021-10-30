import 'package:flutter/material.dart';
import 'package:myapp/Provider/CombinProvider/combine_provider_page.dart';
import 'package:myapp/Provider/ProviderPage/flutter_provider_page.dart';
import 'package:myapp/Provider/ProviderPage/provider_page.dart';
import 'package:myapp/Provider/ScopeProvider/scope_provider_page.dart';
import 'package:myapp/Provider/StateProvider/state_provider.dart';
import 'package:myapp/Provider/StreamProvider/stream_provider_page.dart';

class HomeProviderScreen extends StatelessWidget {
  const HomeProviderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Provider"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProviderPage(),
                      ));
                },
                child: const Text("Provider")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StateProviderPage(),
                      ));
                },
                child: const Text("StateProvider")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FlutterProviderPage(),
                      ));
                },
                child: const Text("FutureProvider")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StreamProviderPage(),
                      ));
                },
                child: const Text("StreamProvider")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScopeProviderPage(),
                      ));
                },
                child: const Text("ScopeProvider")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ComBineProvider(),
                      ));
                },
                child: const Text("ScopeProvider")),
          ],
        ),
      ),
    );
  }
}
