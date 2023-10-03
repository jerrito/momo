
import 'package:flutter/material.dart';

import '../core/Size_of_screen.dart';
import '../pages/Screen.dart';
import 'bottom_Bar.dart';
import 'drawer.dart';

class ConfirmPayment extends StatefulWidget {
  const ConfirmPayment({super.key});

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  MomoScreen(
        key:_scaffoldKey,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottomNavigationBar: BottomAppBar_2(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          borderColor: Colors.black,
          name: "Cancel",
          onPressed: () {},
          borderColor_2: const Color.fromRGBO(20, 100, 150, 1),
          name_2: "Proceed",
          onPressed_2: () {
            setState(() {
              //floatButtonActive=false;
             // buttonIndex = 1;
              //Navigator.pushNamed(context, 'credit');
            });
          },
          backgroundColor_2: const Color.fromRGBO(20, 100, 150, 1),
          icon: const Icon(Icons.arrow_forward),
        ),
        drawer: MoMoDrawer(
          onPressed: () {
            _scaffoldKey.currentState?.closeDrawer();
          },
        ),
      body:Column(
        children:[
          const Text("Confirm Payment"),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
          width: SizeConfig.blockSizeHorizontal * 85.55,
              height: SizeConfig.blockSizeVertical * 11.25,
                child: const ListTile(
                  title: Text("GHC0.5",
                  style:TextStyle(color:Color.fromRGBO(20, 100, 150, 1))),
                  subtitle:Text("Airtime"),
                )),
              Container(
                width: SizeConfig.blockSizeHorizontal * 8.89,
                height: SizeConfig.blockSizeVertical * 11.25,
                decoration:const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Color.fromRGBO(20, 100, 150, 1),

                )
              )
            ],
          ),
          const SizedBox(height:50),
          const Text("For:0240845898"),
          const SizedBox(height:20),
          const Text("Paying with:"),
          const Text("Mobile Money account")
        ]
      )

    );
  }
}
