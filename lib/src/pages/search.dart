import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  Widget _appbar() {  //10분
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xffefefef),
          ),
          child: Row(children: [
            Icon(Icons.search),
            Text(
              '검색',
              style: TextStyle(fontSize: 15, color: Color(0xff838383),
              ),
            )
          ],),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appbar(),
          // _body(),
        ],
      ),
    );
  }
}
