import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seya/provider/provider.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Books'),
      ),
      body: Consumer<GlobalProvider>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.availableBooks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(value.availableBooks[index]),
            );
          },
        ),
      ),
    );
  }
}
