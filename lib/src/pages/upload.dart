import 'package:code_basic/src/components/image_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Upload extends StatelessWidget {
  const Upload({super.key});

  Widget _imagePreview() {
    return Container(
        width: Get.width,
        height: Get.width,
        color: Colors.grey,
    );
  }

  // Widget _header() { //10분
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:0,
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(IconsPath.closeImage),
          ),
        ),
        title: const Text(
          'New Post',
          style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(IconsPath.nextImage, width: 50),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imagePreview(),
            // _header(),
            // _imageSelectList(),
          ],
        ),
      ),
    );
  }
}
