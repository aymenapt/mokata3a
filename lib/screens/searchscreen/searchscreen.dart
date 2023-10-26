import 'package:flutter/material.dart';

import 'package:mokata3a/models/productmodel.dart';

import '../../constant/style.dart';
import '../../widgets/DefaultTextStyle/defaultextstyle.dart';

class SearchScreen extends StatefulWidget {
  List<Product> searchProductList;
  SearchScreen({
    Key? key,
    required this.searchProductList,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: maincolor,
        title: MyDefaultTextStyle(
            text: "نتائج البحث", height: height * 0.025, bold: true),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.searchProductList.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: width * 0.04,
                        right: width * 0.03,
                        top: height * 0.3),
                    child: MyDefaultTextStyle(
                        text:
                            "لا يوجد منتج بهذا الاسم سيتم اضافة المزيد من المنتجات لاحقا",
                        height: height * 0.022,
                        bold: true,
                        color: black),
                  )
                : Container(
                    alignment: Alignment.centerRight,
                    width: width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.searchProductList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(
                                left: width * 0.03,
                                right: width * 0.03,
                                top: height * 0.02),
                            height: height * 0.08,
                            width: width * 0.8,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: width * 0.02),
                                  child: MyDefaultTextStyle(
                                      text:
                                          widget.searchProductList[index].state
                                              ? "يجب مقاطعته"
                                              : "لا يدعم الاحتلال",
                                      height: height * 0.018,
                                      color:
                                          widget.searchProductList[index].state
                                              ? Colors.red
                                              : maincolor),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: width * 0.02),
                                  child: MyDefaultTextStyle(
                                      text: widget
                                          .searchProductList[index].productname,
                                      bold: true,
                                      height: height * 0.018,
                                      color: black),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
          ],
        ),
      )),
    );
  }
}
