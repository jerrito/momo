import 'package:flutter/material.dart';
import 'package:momo/Screen.dart';
import 'package:momo/momoPage.dart';
import 'package:momo/components/credit.dart';
import 'package:momo/components/bottom_Bar.dart' as bottoms;



class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
        title: const Text("More",style:TextStyle(color:Colors.black)),
        floatingAction:const bottoms.FloatingAction(),
        bottomNavigationBar: const BottomAppBar(
          child: bottoms.BottomAppBarMain(
            color_4: Colors.amberAccent,
          ),),
        body: Container(
          color: const Color.fromRGBO(230, 230, 230, 1),
          child: Column(
              children:[
                Flexible(
                  child: ListView(
                    children: const [
                      SizedBox(height:20),
                      Credit(text:"Airtime", Texts: '', ),

                    ],
                  ),
                ),
              ]),

        ));
  }
}
