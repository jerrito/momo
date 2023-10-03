import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  static const String routeName="/loading";
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AlertDialog(
        backgroundColor: Colors.black,
        content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularProgressIndicator(color: Color.fromRGBO(20, 100, 150, 1)),
              Text("Processing", style: TextStyle(color: Colors.white)),
            ]),
      ),
    );
  }
}

class Snack extends StatelessWidget {
  final String message;
  const Snack({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: const Color.fromRGBO(20, 100, 150, 1),
    );
  }
}
