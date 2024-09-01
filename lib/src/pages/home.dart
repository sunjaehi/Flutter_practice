import 'package:code_basic/src/components/avatar_widget.dart';
import 'package:code_basic/src/components/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:code_basic/src/components/image_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
            type: AvatarType.TYPE2,
            thumbPath:
                'https://i.namu.wiki/i/7lKZi8BygJi_mxfoekHKJ0j8GxIn5cKkI50El7rDakNKhpuF3MdIBeuToNW4YOfYjzKloe1q0gdnbyM2bvB1NGU44ht49S5jIEtys6qKhDEP9VH5VI_KGojjEg6CRp-5XvPKS17z9jsSV9qDHlt9zg.webp',
                size: 70,
        ),
        Positioned(
            right:5,
            bottom:0,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Center(
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    height: 1.1,

                  ),
                ),
              ),
            ),
         )
      ],
    );
  }

  Widget _storyBoardList(){
    return SingleChildScrollView(scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          _myStory(),
          const SizedBox(width: 5),
          ...List.generate(
            100, (index) => AvatarWidget(
            type: AvatarType.TYPE1,
            thumbPath:
            'https://image.utoimage.com/preview/cp872722/2022/12/202212008462_500.jpg',
          ),
          )
        ]
      ),
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation:0,
          title: ImageData(IconsPath.logo, width:270),
          actions:[
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ImageData(
                  IconsPath.directMessage,
                  width:50,
                ),
              ),
            )
          ],
        ),
      body: ListView(
        children: [
          _storyBoardList(),
          _postList(),
        ],
      ),
    );
  }
}
