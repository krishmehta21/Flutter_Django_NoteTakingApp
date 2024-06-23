import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:noteapp/url.dart';

class UpdatePage extends StatefulWidget {
  final http.Client client;
  final int id;
  final String note;
  const UpdatePage({
    Key? key,
    required this.client,
    required this.id,
    required this.note,
  }) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController controller = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller.text = widget.note;
  }

  Future<void> _updateNote() async {
    setState(() {
      isLoading = true;
    });

    final response = await widget.client.put(
      Uri.parse(updateUrl(widget.id)),
      body: jsonEncode({'body': controller.text}),
      headers: {'Content-Type': 'application/json'},
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      // Note updated successfully
      Navigator.pop(context, true);
    } else {
      // Handle error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to update note'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Update your note here',
              ),
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _updateNote,
                    child: const Text("Update Note"),
                  ),
          ],
        ),
      ),
    );
  }
}
