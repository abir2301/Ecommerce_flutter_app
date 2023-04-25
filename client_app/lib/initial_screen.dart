import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitialScreen extends ConsumerStatefulWidget {
  String message;
  InitialScreen({super.key, required this.message});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InitialScreenState();
}

class _InitialScreenState extends ConsumerState<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Image.asset("assets/images/logo_app.png"),
          const CircularProgressIndicator(
            color: Colors.blue,
          ),
          Text(
            widget.message,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          )
        ],
      ),
    ));
  }
}
