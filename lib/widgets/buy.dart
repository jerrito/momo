import 'package:flutter/material.dart';
import 'package:momo/pages/Screen.dart';
import 'package:momo/widgets/bottom_Bar.dart' as bottoms;
import 'package:momo/widgets/credit.dart';

import 'drawer.dart';

class BuyCreditPage extends StatefulWidget {
  static const String routeName="/buyCreditPage";
  const BuyCreditPage({Key? key}) : super(key: key);

  @override
  State<BuyCreditPage> createState() => _BuyCreditPageState();
}

class _BuyCreditPageState extends State<BuyCreditPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MomoScreen(
      key:_scaffoldKey,
        title: const Text("Buy/Send", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
        drawer: MoMoDrawer(
          onPressed: () {
            _scaffoldKey.currentState?.closeDrawer();
          },
        ),
        floatingAction: const bottoms.FloatingAction(),
        bottomNavigationBar: const BottomAppBar(
          child: bottoms.BottomAppBarMain(
            color_2: Colors.amberAccent,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromRGBO(230, 230, 230, 1),
          child: Column(children: [
            Flexible(
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  BuyContainer(
                    title: 'Airtime',
                    subtitle: 'TopUp Airtime Pay with MoMo',
                    onTap: () {
                      Navigator.pushNamed(context, 'recipientNetwork');
                    },
                    icon: Icons.phone,
                  ),
                  const SizedBox(height: 10),
                  BuyContainer(
                    title: 'Data',
                    onTap: () {
                      Navigator.pushNamed(context, 'bundleChoice');
                    },
                    subtitle: 'Stay connected to the rest of the \nworld',
                    icon: Icons.compare_arrows_outlined,
                  ),
                  const SizedBox(height: 10),
                  const BuyContainer(
                    title: 'IDD Bundles',
                    subtitle: 'Special international calls offers',
                    icon: Icons.grid_goldenratio_outlined,
                  ),
                  const SizedBox(height: 10),
                  const BuyContainer(
                    title: 'MTN Pulse',
                    subtitle: 'Mashup your bundles',
                    icon: Icons.circle_notifications_outlined,
                  ),
                  const SizedBox(height: 10),
                  const BuyContainer(
                    title: 'Social Bundles',
                    subtitle: 'Get social | Stay',
                    icon: Icons.facebook,
                  ),
                  const SizedBox(height: 10),
                  const BuyContainer(
                    title: 'Others',
                    subtitle: 'Videos, Midnight & Kokrokoo',
                    icon: Icons.add,
                  ),
                  const SizedBox(height: 10),
                  const BuyContainer(
                    title: 'JUST4U',
                    subtitle: 'Unique offers for you',
                    icon: Icons.shopping_bag_outlined,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ]),
        ));
  }
}
