import 'package:flutter/material.dart';


class CategoryDetail extends StatefulWidget {
  const CategoryDetail({Key? key, required this.productId}) : super(key: key);
  final int productId;

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("categorie detail"),),


    );
  }
}