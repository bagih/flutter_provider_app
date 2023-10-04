import 'package:flutter/material.dart';
import 'package:flutter_provider_app/counter_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CounterState(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Consumer<CounterState>(
          builder: (BuildContext context, CounterState value, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    value.count.toString(),
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonMain(
                      icon: Icons.add,
                      onPressed: () {
                        value.increment();
                      },
                    ),
                    ButtonMain(
                      icon: Icons.remove,
                      onPressed: () {
                        value.decrement();
                      },
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class ButtonMain extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onPressed;

  const ButtonMain({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.blue[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(icon),
    );
  }
}
