import 'package:flutter/material.dart';
import 'package:momo/pages/Screen.dart';
import 'package:momo/widgets/credit.dart';
import 'package:momo/widgets/recipient.dart';

class BundleChoicePage extends StatelessWidget {
  static const String routeName="/bundleChoicePage";
  const BundleChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
        title: const Text("Data", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
        body: Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromRGBO(230, 230, 230, 1),
          child: Column(children: [
            Flexible(
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  BuyChoiceFlexiContainer(onTap: () {
                    Navigator.pushNamed(context, "recipient");
                  }),
                  const SizedBox(height: 20),
                  BuyChoiceContainer(
                    bundle: "24.05",
                    price: "0.5",
                    onTap: () {
                      Navigator.pushNamed(context, "recipient");
                    },
                  ),
                  const SizedBox(height: 20),
                  BuyChoiceContainer(
                    bundle: "48.10",
                    price: "1",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return const Recipient(amount: "1",
                              bundle:"48.10" ,);
                          }));                     },
                  ),
                  const SizedBox(height: 20),
                  BuyChoiceContainer(
                    bundle: "471.70",
                    price: "3",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return const Recipient(amount: "3",
                              bundle:"471.70" ,);
                          }));                       },
                  ),
                  const SizedBox(height: 20),
                  BuyChoiceContainer(
                    bundle: "971.82",
                    price: "10",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return const Recipient(amount: "10",
                            bundle:"971.82" ,);
                          }));                    },
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
