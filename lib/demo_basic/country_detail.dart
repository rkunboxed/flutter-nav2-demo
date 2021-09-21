import 'package:flutter/material.dart';
import 'package:flutter_nav2_demo/common/image_detail_model.dart';

class CountryDetail extends StatelessWidget {
  const CountryDetail(this.imageDetail, {Key? key}) : super(key: key);

  final ImageDetail imageDetail;

  @override
  Widget build(BuildContext context) {
    //TODO get the country from the current route
    return Container(
      child: Column(
        children: [
          Text(imageDetail.country),
          Text('Photo credit: ${imageDetail.photographer}'),
        ],
      ),
    );
  }
}
