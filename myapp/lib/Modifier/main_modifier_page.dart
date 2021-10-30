import 'package:flutter/material.dart';
import 'package:myapp/Modifier/auto_dispose_modifier_page.dart';
import 'package:myapp/Modifier/family_object_page.dart';
import 'package:myapp/Modifier/family_primitive_page.dart';

class ModifierPage extends StatelessWidget {
  const ModifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ModifierPage"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FamilyPrimitivePage(),
                      ));
                },
                child: const Text("Family Primitive")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FamilyObjectPage(),
                      ));
                },
                child: const Text("Family Object")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AutoDisposeWidgetModifierPage(),
                      ));
                },
                child: const Text("Auto Dispose"))
          ],
        ),
      ),
    );
  }
}
