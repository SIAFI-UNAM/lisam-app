import 'package:flutter/material.dart';

class LettersTile extends StatelessWidget {
  final List<String> letters;

  const LettersTile({Key? key, required this.letters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textColor = Colors.blueGrey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Letras:",
          style: TextStyle(
            fontSize: 18,
            color: textColor,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
            children: letters
                .map((letter) => Text(
                      letter,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ))
                .toList())
      ],
    );
  }
}
