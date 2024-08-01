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
        appBar: AppBar(),
        body: Container(
          height: 100,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset('KakaoTalk_20240727_225507249.jpg', width: 200, height: 150,),
              Container(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('숭이짤',style: TextStyle(fontSize: 15),),
                    Text('귀야워ㅠ'),
                    Text('사진'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite),
                        Text('4'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );

  }
}
