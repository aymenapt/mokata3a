import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mokata3a/constant/style.dart';
import 'package:mokata3a/screens/searchscreen/searchscreen.dart';
import 'package:mokata3a/widgets/DefaultTextStyle/defaultextstyle.dart';
import 'package:mokata3a/widgets/mytextfromfield/my_textfrom_field.dart';
import 'package:mokata3a/widgets/mytoast/mytoast.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/productmodel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController searchProduct = TextEditingController();

  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  List<Product> productList = [];
  List<Product> matchingProducts = [];

  void searchProducts(String searchname) {
    matchingProducts.clear();

    for (Product product in productList) {
      if (product.productname.contains(searchname)) {
        setState(() {
          matchingProducts.add(product);
          print(matchingProducts);
        });
      }
    }
  }

  fetchproducts() {
    databaseReference.child("products").once().then((snap) {
      if (snap.snapshot.value != null) {
        (snap.snapshot.value as Map).forEach((key, value) {
          Product product = Product(
            productname: key,
            state: value["state"],
          );
          setState(() {
            productList.add(product);
          });
        });
      }

      print(productList[0].productname);
    });
  }

  @override
  void initState() {
    fetchproducts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: maincolor,
        title: MyDefaultTextStyle(
            text: "المقاطعة كفاح", height: height * 0.025, bold: true),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: height * 0.04,
                      left: width * 0.03,
                      right: width * 0.03),
                  child: TextField(
                    cursorColor: white,
                    controller: searchProduct,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (searchProduct.text.isEmpty) {
                              showtoast("الرجاء ادخال ما تريد البحث عنه");
                            } else {
                              searchProducts(searchProduct.text);

                              Navigator.push(
                                  context,
                                  PageTransition(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      type: PageTransitionType.leftToRight,
                                      child: SearchScreen(
                                        searchProductList: matchingProducts,
                                      )));
                            }
                          },
                          icon: const Icon(
                            Icons.search,
                            color: white,
                            size: 20,
                          ),
                        ),
                        fillColor: maincolor,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide:
                                const BorderSide(color: white, width: 2)),
                        hintText: "ابحث عن المنتج",
                        hintStyle: const TextStyle(color: white, fontSize: 13),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Colors.white))),
                  )),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                margin:
                    EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                child: MyDefaultTextStyle(
                    text: "اهم المنتجات التي يجب مقاطعتها",
                    height: height * 0.031,
                    bold: true,
                    color: black),
              ),
              productList.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: height * 0.08),
                      child: const CircularProgressIndicator(
                        color: maincolor,
                      ),
                    )
                  : Container(
                      alignment: Alignment.centerRight,
                      width: width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return productList[index].state
                                ? Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: width * 0.02),
                                          child: MyDefaultTextStyle(
                                              text: "يجب مقاطعته",
                                              height: height * 0.018,
                                              color: Colors.red),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: width * 0.02),
                                          child: MyDefaultTextStyle(
                                              text: productList[index]
                                                  .productname,
                                              bold: true,
                                              height: height * 0.018,
                                              color: black),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container();
                          }),
                    ),
              SizedBox(
                height: height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
