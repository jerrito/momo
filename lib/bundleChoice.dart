import 'package:flutter/material.dart';
import 'package:momo/Screen.dart';
import 'package:momo/momoPage.dart';
import 'package:momo/components/credit.dart';
import 'package:momo/components/bottom_Bar.dart' as bottoms;



class BundleChoicePage extends StatelessWidget {
  const BundleChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
        title: const Text("Data",style:TextStyle(color:Colors.black)),
        actions: [
          IconButton(icon: const Icon(Icons.format_align_justify,color:Colors.black),
            onPressed: () {},),],
        body: Container(
          padding: EdgeInsets.all(10),
          color: const Color.fromRGBO(230, 230, 230, 1),
          child: Column(
              children:[
                Flexible(
                  child: ListView(
                    children:  [
                      SizedBox(height:20),
                      BuyChoiceFlexiContainer(onTap:(){}),
                      SizedBox(height:20),
                      BuyChoiceContainer(bundle: "24.05", price: "0.5", onTap: () {  },),
                      SizedBox(height:20),
                      BuyChoiceContainer(bundle: "48.10", price: "1",
                        onTap: () {  },),
                      SizedBox(height:20),
                      BuyChoiceContainer(bundle: "471.70", price: "3", onTap: () {  },
                       ),
                      SizedBox(height:20),
                      BuyChoiceContainer(bundle: "971.82", price: "10",
                        onTap: () {  },),



                    ],
                  ),
                ),
              ]),

        ));
  }
}
