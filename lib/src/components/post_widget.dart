import 'package:code_basic/src/components/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:code_basic/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  Widget _header() {
    return Row(  //35분
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AvatarWidget(
            type: AvatarType.TYPE3,
            nickname: 'sunjae_hi',
            size: 45,
            thumbPath:
              'https://i.namu.wiki/i/7lKZi8BygJi_mxfoekHKJ0j8GxIn5cKkI50El7rDakNKhpuF3MdIBeuToNW4YOfYjzKloe1q0gdnbyM2bvB1NGU44ht49S5jIEtys6qKhDEP9VH5VI_KGojjEg6CRp-5XvPKS17z9jsSV9qDHlt9zg.webp'),
        GestureDetector(
          onTap: () {},
          child: ImageData(
              IconsPath.postMoreIcon,
              width : 30,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _header(),
          // _image(),
          // _infoCount(),
          // _infoDescription(),
          // _replyTextBtn(),
          // _dateAgo(),
        ],
      ),
    );
  }
}
