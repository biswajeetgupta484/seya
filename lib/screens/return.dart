import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seya/provider/provider.dart';

class Return extends StatefulWidget {
  const Return({Key? key}) : super(key: key);

  @override
  State<Return> createState() => _ReturnState();
}

class _ReturnState extends State<Return> {
  String? selectedBook;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Return Books'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<GlobalProvider>(
            builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  hint: const Text('Select Book to Return'),
                  value: selectedBook,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBook = newValue;
                    });
                  },
                  items: value.takenBooks.map((book) {
                    return DropdownMenuItem<String>(
                      value: book,
                      child: Text(book),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedBook != null) {
                      print(selectedBook);
                      value.addBooks(selectedBook!);
                      selectedBook = null;
                    }
                  },
                  child: const Text('Return Book'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
