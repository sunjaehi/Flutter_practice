import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('앱'),
            backgroundColor:Colors.blue),
        body: Container(child: Text('안녕')),
        bottomNavigationBar: BottomNavigationBar(
            items: const<BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.phone),
                  label:'Phone',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label:'Message',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_page),
                  label:'Contact',

            ),
          ],
        )
      )
    );
  }
}
