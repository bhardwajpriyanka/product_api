import 'package:flutter/material.dart';
import 'package:product_api/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class product_screen extends StatefulWidget {
  const product_screen({Key? key}) : super(key: key);

  @override
  State<product_screen> createState() => _product_screenState();
}

class _product_screenState extends State<product_screen> {
  @override
  void initState() {
    super.initState();

    Provider.of<ProductProvider>(context, listen: false).ProductApiCall();
  }

  ProductProvider? pt, pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<ProductProvider>(context, listen: true);
    pf = Provider.of<ProductProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Detail"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'data',arguments: index);
                    },
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black12,)),
                      child: Row(
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child:
                                  Image.network("${pt!.l1[index].image}"))),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Id:- ${pt!.l1[index].id}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      )),
                              SizedBox(
                                height: 8,
                              ),
                              Text("category:- ${pt!.l1[index].category}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              SizedBox(
                                height: 8,
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Price:- \$ ${pt!.l1[index].price}",
                                                style: TextStyle(
                                                    fontSize: 20, color: Colors.black,)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: pt!.l1.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
