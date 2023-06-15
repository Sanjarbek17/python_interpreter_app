import 'package:flutter/material.dart';

class OutputWidget extends StatelessWidget {
  const OutputWidget({
    super.key,
    required this.output,
  });

  final String output;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.black87,
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Output', style: TextStyle(color: Colors.white)),
            const Divider(color: Colors.white),
            Text(output, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
