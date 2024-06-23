import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'url.dart';

class CreatePage extends StatefulWidget {
  final http.Client client;

  const CreatePage({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  State<CreatePage> createState() => _CreateState();
}

class _CreateState extends State<CreatePage> {
  final TextEditingController controller = TextEditingController();
  bool isLoading = false;

  Future<void> _createNote() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await widget.client.post(
        Uri.parse(createUrl()),
        body: jsonEncode({'body': controller.text}),
        headers: {'Content-Type': 'application/json'},
      );

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        // Note created successfully
        Navigator.pop(context, true);
      } else {
        // Handle error
        _showErrorDialog(
            'Failed to create note. Status code: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _showErrorDialog('An error occurred: $e');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your note here',
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _createNote,
                    child: const Text("Create Note"),
                  ),
          ],
        ),
      ),
    );
  }
}
