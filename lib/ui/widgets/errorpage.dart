import 'package:flutter/material.dart';

class Errorpage extends StatefulWidget {
  final String error;
  const Errorpage({super.key, required this.error});

  @override
  State<Errorpage> createState() => _ErrorpageState();
}

class _ErrorpageState extends State<Errorpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(77, 6, 8, 71),
        Color.fromARGB(255, 30, 20, 20)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            const Text(
              "Error!",
              style: TextStyle(
                  color: const Color.fromARGB(255, 3, 35, 61),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.error,
              style: const TextStyle(
                  color: const Color.fromARGB(255, 3, 35, 61),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              shape: Border.all(),
              color: const Color.fromARGB(255, 3, 35, 61),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "TRY AGAIN",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
