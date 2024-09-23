import 'package:flutter/material.dart';

class ActiveHistory extends StatelessWidget {
  const ActiveHistory({super.key});

  Widget  _newRecentlyActiveView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('오늘',
            style: TextStyle(
                fontSize: 16,
            ),
          ),
        ]
      ),
    );
  }

  Widget _newRecentlyThisWeekView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('이번주',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ]
      ),
    );
  }

  Widget _newRecentlyThisMonthView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('이번달',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true, //가운데 정렬
        title: const Text(
          '활동',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(child: Column(
        children: [
          _newRecentlyActiveView(),
          _newRecentlyThisWeekView(),
          _newRecentlyThisMonthView(),
        ],
      ),
      ),
    );
  }
}
