import 'package:flutter/material.dart';
import 'package:momo/Screen.dart';
import 'package:momo/components/bottom_Bar.dart';
import 'package:momo/components/button_input.dart';
import 'package:momo/components/drawer.dart';
import 'package:momo/userProvider.dart';
import 'package:provider/provider.dart';

class Recipient extends StatefulWidget {
  const Recipient({Key? key}) : super(key: key);

  @override
  State<Recipient> createState() => _RecipientState();
}

class _RecipientState extends State<Recipient> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserProvider? userProvider;
  bool other = false;
  String user = "user";

  @override
  void initState() {
    userProvider = context.read<UserProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
        keys: _scaffoldKey,
        title: const Text("Buy/Send", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.format_align_justify, color: Colors.black),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ],
        bottomNavigationBar: BottomAppBar_2(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          borderColor: Colors.black,
          name: "Back",
          onPressed: () {},
          borderColor_2: Color.fromRGBO(20, 100, 150, 1),
          name_2: "Proceed",
          onPressed_2: () {
            Navigator.pushNamed(context, "buyChoiceSelf");
          },
          backgroundColor_2: Color.fromRGBO(20, 100, 150, 1),
          icon: Icon(Icons.arrow_forward),
        ),
        drawer: MoMoDrawer(
          onPressed: () {
            _scaffoldKey.currentState?.closeDrawer();
          },
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            color: const Color.fromRGBO(230, 230, 230, 1),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                  child: Text("Recipient",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 26))),
              SizedBox(
                height: 20,
              ),
              Text("I am buying for:"),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                        width: 2,
                        color: Colors.black,
                        style: BorderStyle.solid)),
                child: RadioListTile(
                  value: "user",
                  activeColor: Colors.black,
                  groupValue: user,
                  tileColor: Colors.deepOrange,
                  onChanged: (value) {
                    other = false;
                    setState(() {
                      user = value.toString();
                    });
                  },
                  title: Text(
                      "Self(0${userProvider?.appUser?.number?.substring(4)})"),
                ),
              ),
              // Text("Self(0240845898)"),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                        width: 2,
                        color: Colors.black,
                        style: BorderStyle.solid)),
                child: RadioListTile(
                  value: "others",
                  activeColor: Colors.black,
                  groupValue: user,
                  tileColor: Colors.deepOrange,
                  onChanged: (value) {
                    other = true;
                    setState(() {
                      user = value.toString();
                    });
                  },
                  title: Text("others"),
                ),
              ),
              SizedBox(height: 25),
              Visibility(
                  visible: other,
                  child: Text("Phone number",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
              Visibility(
                  visible: other,
                  child: SizedBox(
                      width: 300,
                      child: DefaultTextInput(
                        hintText: 'eg.0248363154',
                      )))
            ])));
  }
}
