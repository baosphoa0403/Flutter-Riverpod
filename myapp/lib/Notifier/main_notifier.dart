import 'package:flutter/material.dart';
import 'package:myapp/Notifier/ChageNotifierPage/change_notifier_page.dart';
import 'package:myapp/Notifier/StateNotifierPage/state_notifier_page.dart';

class HomeNotifierPage extends StatelessWidget {
  const HomeNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeNotifierPage"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeNotifierPage(),
                      ));
                },
                child: const Text("StateNotifierProvider")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StateNotifierPage(),
                      ));
                },
                child: const Text("ChangeNotifierProvider")),
          ],
        ),
      ),
    );
  }
}
