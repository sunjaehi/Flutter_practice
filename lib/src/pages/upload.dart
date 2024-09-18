import 'package:code_basic/src/components/image_data.dart';
import 'package:flutter/material.dart';
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
  }
  void update()=>setState(() {});

  Widget _imagePreview() {
    var width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        height: width,
        color: Colors.grey,
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(children: [
              Text(headerTitle, style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              ),
              Icon(Icons.arrow_drop_down),
            ],),
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
        return Container(
          //15분
        );
      }
    );
  }

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
            _header(),
            _imageSelectList(),
          ],
        ),
      ),
    );
  }
}
