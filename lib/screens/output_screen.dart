import 'package:flutter/material.dart';

class OutputPage extends StatelessWidget {
  const OutputPage({
    super.key,
    required this.output,
  });

  final String output;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.black87,
      child: Center(
        child: Column(
          children: [
            const Text('Output', style: TextStyle(color: Colors.white)),
            const Divider(),
            Text(output, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
