import 'package:flutter/material.dart';
import 'package:momo/models/userProvider.dart';
import 'package:momo/pages/Screen.dart';
import 'package:momo/widgets/bottom_Bar.dart';
import 'package:momo/widgets/button_input.dart';
import 'package:momo/widgets/credit.dart';
import 'package:momo/widgets/drawer.dart';
import 'package:provider/provider.dart';

class Recipient extends StatefulWidget {
  static const String routeName="/recipient";
  final String? amount;
  final String? bundle;
  const Recipient({Key? key, this.amount, this.bundle}) : super(key: key);

  @override
  State<Recipient> createState() => _RecipientState();
}

class _RecipientState extends State<Recipient> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  UserProvider? userProvider;
  bool other = false;
  String user = "user";
  final numberController=TextEditingController();
  String number="";

  @override
  void initState() {
    super.initState();
    userProvider = context.read<UserProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
        keys: _scaffoldKey,
        title: const Text("Buy/Send", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
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
          borderColor_2: const Color.fromRGBO(20, 100, 150, 1),
          name_2: "Proceed",
          onPressed_2: () {
            if(user=="user"){
              setState((){
                number="0${userProvider!.appUser!.number!.substring(4)}";
              });
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return  BuyChoiceSelf(number: number,);
                  }));
            }
            else{
              if(formKey.currentState?.validate()==true){
              setState((){
                number=numberController.text;
              });
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return  BuyChoiceSelf(number: number,);
                  }));
              }}

              },
          backgroundColor_2: const Color.fromRGBO(20, 100, 150, 1),
          icon: const Icon(Icons.arrow_forward),
        ),
        drawer: MoMoDrawer(
          onPressed: () {
            _scaffoldKey.currentState?.closeDrawer();
          },
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            color: const Color.fromRGBO(230, 230, 230, 1),
            child: Form(
              key:formKey,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Center(
                    child: Text("Recipient",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26))),
                const SizedBox(height: 20,),
                const Text("I am buying for:"),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),),
                      border: Border.all(
                          width: 2,color: Colors.black,
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
                const SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
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
                    title: const Text("others"),
                  ),
                ),
                const SizedBox(height: 25),
                Visibility(
                    visible: other,
                    child: const Text("Phone number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))),
                Visibility(
                    visible: other,
                    child: SizedBox(
                        width: 300,
                        child: DefaultTextInput(
                          validator: phoneNumberValidator,
                          keyboardType: TextInputType.number,
                          controller:numberController,
                          hintText: 'eg.0248363154',
                        )))
              ]),
            )));
  }
  String? phoneNumberValidator(String? value) {
    final pattern = RegExp("([0][2358])[0-9]{8}");
    if(value=="0${userProvider?.appUser?.number?.substring(4)}"){
      return "";
    }
   else if (pattern.stringMatch(value ?? "") != value) {
      return "";
    }

    else if (value?.isEmpty == true) {
      return "";
    }
    return null;
  }

  String? pinValidator(String? value) {
    final pattern = RegExp("[0-9]{4}");
    if (value?.isEmpty == true) {
      return "";
    } else if (pattern.stringMatch(value ?? "") != value) {
      return "";
    }
    return null;
  }

}
