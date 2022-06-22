import 'package:flutter/material.dart';

class LettersTile extends StatelessWidget {
  final List<String> letters;

  const LettersTile({Key? key, required this.letters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textColor = Colors.blueGrey;
    const textStyle = TextStyle(
      fontSize: 18,
      color: textColor,
    );

    if (letters.isEmpty) {
      return Center(
        child: Column(
          children: const [
            SizedBox(
              height: 18,
            ),
            Text(
              'Aún no se han reconocido señas',
              style: textStyle,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Letras:",
          style: textStyle,
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
