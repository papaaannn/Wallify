import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallify/models/photos_model.dart';
import 'package:wallify/view/image_view.dart';

Widget wallPaper(List<PhotosModel> listPhotos, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: listPhotos.map((PhotosModel photoModel) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgPath: photoModel.src.portrait,
                          )));
            },
            child: Hero(
              tag: photoModel.src.portrait,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: kIsWeb
                        ? Image.network(
                            photoModel.src.portrait,
                            height: 50,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: photoModel.src.portrait,
                            placeholder: (context, url) => Container(
                                  color: Color(0xFFAAAAAA),
                                ),
                            fit: BoxFit.cover)),
              ),
            ),
          ));
        }).toList()),
  );
}

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Walli",
        style: TextStyle(color: Colors.white, fontFamily: 'Overpass'),
      ),
      Text(
        "fy: ",
        style: TextStyle(color: Colors.pink, fontFamily: 'Overpass'),
      ),
      Text(
        "Your ",
        style: TextStyle(color: Colors.white, fontFamily: 'Overpass'),
      ),
      Text(
        "Wallpapers",
        style: TextStyle(color: Colors.pink, fontFamily: 'Overpass'),
      ),
    ],
  );
}
