import 'package:flutter/material.dart';
import 'package:rental_mobile/views/dashboard/home.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Mobile Horayy'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "Ratting Session",
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: const Divider(
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Text(
                    'Comment',
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(Icons.message))
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Text(
                    'Suggestions',
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(Icons.message))
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_circle_right),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => HomeScreen()),
              ),
            );
          }),
    );
  }
}
