import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seya/provider/provider.dart';

class Take extends StatefulWidget {
  const Take({Key? key}) : super(key: key);

  @override
  State<Take> createState() => _TakeState();
}

class _TakeState extends State<Take> {
  String? selectedBook;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Book'),
      ),
      body: Center(
        child: Consumer<GlobalProvider>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  hint: const Text('Select Book'),
                  value: selectedBook,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBook = newValue;
                    });
                  },
                  items: value.availableBooks.map((book) {
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
                      value.removeBooks(selectedBook!.toString());
                      selectedBook = null;
                    }
                  },
                  child: const Text('Take Book'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
