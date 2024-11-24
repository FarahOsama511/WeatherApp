import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  Function(String)? onchanged;
  Function(String)? onsubmitted;
  Widget? suffixIcon;
  Textfield({super.key, this.onchanged, this.onsubmitted, this.suffixIcon});

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            style: TextStyle(color: Colors.white),
            onChanged: widget.onchanged,
            onSubmitted: widget.onsubmitted,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              hintText: "Search",
              hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(32),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            cursorColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
