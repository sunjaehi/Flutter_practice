import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_basic/src/pages/search/search_focus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    for(var i=0; i<100; i++) {
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;
      if(gi!=1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gi].add(size);
    }
  }
  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Get.to(SearchFocus());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchFocus()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              margin: const EdgeInsets.only(left: 15),
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
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Icon(Icons.location_pin),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            groupBox.length,
            (index) => Expanded(
                child: Column(
                  children: List.generate(
                    groupBox[index].length,
                        (jndex) => Container(
                          height: Get.width*0.33*groupBox[index][jndex],
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)]),
                        child :CachedNetworkImage(imageUrl: 'https://i.namu.wiki/i/7lKZi8BygJi_mxfoekHKJ0j8GxIn5cKkI50El7rDakNKhpuF3MdIBeuToNW4YOfYjzKloe1q0gdnbyM2bvB1NGU44ht49S5jIEtys6qKhDEP9VH5VI_KGojjEg6CRp-5XvPKS17z9jsSV9qDHlt9zg.webp',fit: BoxFit.cover,
                        ),
                      ),
                    ).toList(),
                  ),
                ),)),
        // children: [
        //   Expanded(
        //     child: Column(
        //       children: [
        //         Container(
        //           height: 140,
        //           color: Colors.red,
        //         ),
        //     ],),
        //   ),
        //   Expanded(
        //     child: Column(children: [
        //       Container(height: 140,color: Colors.blue,)
        //     ],),
        //   ),
        //   Expanded(
        //     child: Column(children: [
        //       Container(height: 140,color: Colors.grey,)
        //     ],),
        //   ),
        // ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appbar(),
            Expanded(child: _body()),
          ],
        ),
      ),
    );
  }
}
