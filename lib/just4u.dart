import 'package:flutter/material.dart';
import 'package:momo/Screen.dart';
import 'package:momo/momoPage.dart';
import 'package:momo/components/credit.dart';
import 'package:momo/components/bottom_Bar.dart' as bottoms;



class Just4uPage extends StatelessWidget {
  const Just4uPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
        title: const Text("Just 4 U",style:TextStyle(color:Colors.black)),
        floatingAction:const bottoms.FloatingAction(),
        bottomNavigationBar: const BottomAppBar(
          child: bottoms.BottomAppBar(
            color_3: Colors.amberAccent,
          ),),
        body: Container(
          color: const Color.fromRGBO(230, 230, 230, 1),
          child: Column(
              children:[
                Flexible(
                  child: ListView(
                    children: const [
                      SizedBox(height:20),
                      Credit(text:"Airtime", Texts: '' ,),

                    ],
                  ),
                ),
              ]),

        ));
  }
}
