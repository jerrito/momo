import 'package:flutter/material.dart';
import 'package:momo/pages/Screen.dart';
import 'package:momo/widgets/bottom_Bar.dart' as bottoms;
import 'package:momo/widgets/credit.dart';
import 'package:momo/widgets/drawer.dart';
class Just4uPage extends StatefulWidget {
  static const String routeName="/just4uPage";
  const Just4uPage({Key? key}) : super(key: key);

  @override
  State<Just4uPage> createState() => _Just4uPageState();
}

class _Just4uPageState extends State<Just4uPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
        keys: _scaffoldKey,
        drawer: MoMoDrawer(
          onPressed: () {
            _scaffoldKey.currentState?.closeDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ],
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
                    texts: '',
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
