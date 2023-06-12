import 'package:flutter/material.dart';
import 'package:momo/pages/Screen.dart';
import 'package:momo/widgets/bottom_Bar.dart' as bottoms;
import 'package:momo/widgets/credit.dart';

class Just4uPage extends StatelessWidget {
  const Just4uPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
        title: const Text("Just 4 U", style: TextStyle(color: Colors.black)),
        floatingAction: const bottoms.FloatingAction(),
        bottomNavigationBar: const BottomAppBar(
          child: bottoms.BottomAppBarMain(
            color_3: Colors.amberAccent,
          ),
        ),
        body: Container(
          color: const Color.fromRGBO(230, 230, 230, 1),
          child: Column(children: [
            Flexible(
              child: ListView(
                children: const [
                  SizedBox(height: 20),
                  Credit(
                    text: "Airtime",
                    Texts: '',
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
