import 'package:flutter/material.dart';
import 'package:momo/Screen.dart';
import 'package:momo/components/bottom_Bar.dart' as bottoms;
import 'package:momo/components/credit.dart';

class BuyCreditPage extends StatelessWidget {
  const BuyCreditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
        title: const Text("Buy/Send", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.format_align_justify, color: Colors.black),
            onPressed: () {},
          ),
        ],
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
                  SizedBox(height: 20),
                  BuyContainer(
                    title: 'Airtime',
                    subtitle: 'TopUp Airtime Pay with MoMo',
                    onTap: () {
                      Navigator.pushNamed(context, 'recipient');
                    },
                    icon: Icons.phone,
                  ),
                  SizedBox(height: 10),
                  BuyContainer(
                    title: 'Data',
                    onTap: () {
                      Navigator.pushNamed(context, 'bundleChoice');
                    },
                    subtitle: 'Stay connected to the rest of the \nworld',
                    icon: Icons.compare_arrows_outlined,
                  ),
                  SizedBox(height: 10),
                  BuyContainer(
                    title: 'IDD Bundles',
                    subtitle: 'Special international calls offers',
                    icon: Icons.grid_goldenratio_outlined,
                  ),
                  SizedBox(height: 10),
                  BuyContainer(
                    title: 'MTN Pulse',
                    subtitle: 'Mashup your bundles',
                    icon: Icons.circle_notifications_outlined,
                  ),
                  SizedBox(height: 10),
                  BuyContainer(
                    title: 'Social Bundles',
                    subtitle: 'Get social | Stay',
                    icon: Icons.facebook,
                  ),
                  SizedBox(height: 10),
                  BuyContainer(
                    title: 'Others',
                    subtitle: 'Videos, Midnight & Kokrokoo',
                    icon: Icons.add,
                  ),
                  SizedBox(height: 10),
                  BuyContainer(
                    title: 'JUST4U',
                    subtitle: 'Unique offers for you',
                    icon: Icons.shopping_bag_outlined,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ]),
        ));
  }
}
