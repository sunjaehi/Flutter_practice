import 'dart:typed_data';

import 'package:code_basic/src/components/image_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  var albums = <AssetPathEntity>[];
  var imageList = <AssetEntity>[];
  var headerTitle = '';
  AssetEntity? selectedImage;

  @override
  void initState() {
    super.initState();
    _loadPhotos();
  }

  void _loadPhotos() async{
    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      albums = await PhotoManager.getAssetPathList(
          type: RequestType.image,
          filterOption: FilterOptionGroup(
              imageOption: const FilterOption(
                sizeConstraint: SizeConstraint(minHeight: 100, minWidth: 100),
              ),
            orders: [
              const OrderOption(type: OrderOptionType.createDate, asc: false),
            ]
          ),
      );
      _loadData();
    }else {
      //message 권한 요청
    }
  }

  void _loadData() async{
    headerTitle = albums.first.name;
    await _pagingPhotos();
    update();
  }
  Future<void> _pagingPhotos() async{
    var photos = await albums.first.getAssetListPaged(page: 0, size: 30);
    imageList.addAll(photos);
    selectedImage = imageList.first;
  }
  void update()=>setState(() {});

  Widget _imagePreview() {
    var width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        height: width,
        color: Colors.grey,
        child: selectedImage == null
            ? Container()
            : _photoWidget(
                selectedImage!,
                width.toInt(),
                builder: (data) {
                  return Image.memory(
                    data,
                    fit: BoxFit.cover,
                  );
                }
        ),
    );

  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  isScrollControlled: albums.length > 10 ? true : false,
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top,

                  ), //상단에 여백 주기
                  builder: (_)=>Container(
                    height: albums.length > 10 ? Size.infinite.height : albums.length * 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(top:7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black54,
                            ),
                            width: 40,
                            height: 4,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: List.generate(
                                    albums.length,
                                    (index)=>Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                      child: Text('albums[index].name'),
                                    ),
                                  ),
                                ),
                              ),
                        )
                    ]),
                  ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(children: [
                Text(headerTitle, style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],),
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical:5, horizontal: 10),
                decoration: BoxDecoration(color: const Color(0xff808080),borderRadius: BorderRadius.circular(30)),
                child: Row(children: [
                ImageData(IconsPath.imageSelectIcon),
                const SizedBox(width: 7),
                const Text(
                  '여러 항목 선택',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              ],),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff808080),
                ),
                child: ImageData(IconsPath.cameraIcon),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _imageSelectList() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(), //스크롤 X
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:4, //가로 이미지 개수
        childAspectRatio: 1,
        mainAxisSpacing:1,
        crossAxisSpacing: 1,
      ),
      itemCount: imageList.length,
      itemBuilder: (BuildContext context, int index) {
        return _photoWidget(imageList[index],200, builder:(data) {
          return GestureDetector(
            onTap: () {
              selectedImage = imageList[index];
              update();
            },
            child: Opacity(
              opacity: imageList[index] == selectedImage ? 0.3 :1,
              child: Image.memory(
                data,
                fit: BoxFit.cover,
              ),
            ),
          );
        });
      },
    );
  }

  Widget _photoWidget(AssetEntity asset, int size, {required Widget Fuction(Uint8List) builder}) {
    return FutureBuilder(
        future: asset.thumbnailDataWithSize(200 as ThumbnailSize),
        builder: (_, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasData) {
            return builder(snapshot.data!);
          } else { 
            return Container();
          }
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:0,
        leading: GestureDetector(
          onTap: Get.back,
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
            _header(),
            _imageSelectList(),
          ],
        ),
      ),
    );
  }
}
