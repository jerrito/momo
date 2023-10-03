import 'package:flutter/material.dart';
import 'package:momo/pages/Screen.dart';
import 'package:momo/widgets/bottom_Bar.dart' as bottoms;
import 'package:momo/widgets/credit.dart';
import 'package:momo/widgets/drawer.dart';
class MorePage extends StatefulWidget {
  static const String routeName="/morePage";
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
        keys: _scaffoldKey,
        title: const Text("More", style: TextStyle(
            color: Colors.black)),
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
        floatingAction: const bottoms.FloatingAction(),
        bottomNavigationBar: const BottomAppBar(
          child: bottoms.BottomAppBarMain(
            color_4: Colors.amberAccent,
            color_1: Colors.black,
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
