import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
// import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/python.dart';

// improt http
import 'package:http/http.dart' as http;

import 'output_screen.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  final controller = CodeController(text: '', language: python);
  String output = '';

  @override
  void initState() {
    super.initState();
    controller.popupController.enabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // request
          String body = controller.text;
          http.Response response = await http.post(
            Uri.parse('http://127.0.0.1:5000/'),
            headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode(<String, String>{
              'code': body,
            }),
          );
          setState(() {
            output = response.body;
          });
          if (response.statusCode == 200) {
            // ignore: use_build_context_synchronously
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return OutputPage(output: output);
              },
            );
          }
        },
        child: const Icon(Icons.play_arrow),
      ),
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Editor'),
      ),
      body: CodeTheme(
        data: CodeThemeData(styles: draculaTheme),
        child: SingleChildScrollView(
          child: CodeField(
            controller: controller,
            textStyle: GoogleFonts.sourceCodePro(),
          ),
        ),
      ),
    );
  }
}
