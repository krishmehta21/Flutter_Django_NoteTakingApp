import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:noteapp/create.dart';
import 'package:noteapp/note.dart';
import 'package:noteapp/update.dart';
import 'package:noteapp/url.dart'; // Import the url.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Note Taking App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Client client = http.Client();
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    _retrieveNotes();
  }

  _retrieveNotes() async {
    notes = [];
    final response = await client.get(Uri.parse(retrieveUrl()));
    if (response.statusCode == 200) {
      List responseList = json.decode(response.body);
      responseList.forEach((element) {
        notes.add(Note.fromMap(element));
      });
      setState(() {});
    } else {
      // Handle error
    }
  }

  void _deleteNode(int id) async {
    final response = await client.delete(Uri.parse(deleteUrl(id)));
    if (response.statusCode == 200) {
      _retrieveNotes();
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _retrieveNotes();
        },
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(notes[index].note),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UpdatePage(
                    client: client,
                    id: notes[index].id,
                    note: notes[index].note,
                  ),
                ));
              },
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteNode(notes[index].id),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CreatePage(client: client),
        )),
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
