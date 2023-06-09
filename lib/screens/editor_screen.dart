import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/python.dart';

class EditorPage extends StatelessWidget {
  final controller = CodeController(text: '', language: python, readOnlySectionNames: {'section1'});
  EditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(controller.text);
        },
        child: const Icon(Icons.play_arrow),
      ),
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Editor'),
      ),
      body: CodeTheme(
        data: CodeThemeData(styles: monokaiSublimeTheme),
        child: SingleChildScrollView(
          child: CodeField(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
