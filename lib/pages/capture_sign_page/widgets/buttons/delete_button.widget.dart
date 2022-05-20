import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final void Function()? onPressed;
  const DeleteButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.red,
        child: const Icon(Icons.delete),
      );
}
