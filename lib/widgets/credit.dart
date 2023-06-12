import 'package:flutter/material.dart';
import 'package:momo/core/Size_of_screen.dart';
import 'package:momo/widgets/button_input.dart';

class Credit extends StatelessWidget {
  final IconData? icon;
  final String Texts;
  final String text;
  const Credit({Key? key, this.icon, required this.Texts, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      height: SizeConfig.blockSizeVertical * 10,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ListTile(
        leading: Column(children: [
          Text(text),
          SizedBox(height: SizeConfig.blockSizeVertical * 0.65),
          Icon(
            icon,
            color: Colors.amber,
            size: 32,
          )
        ]),
        title: Text(Texts,
            style: TextStyle(
                color: Color.fromRGBO(20, 100, 150, 1),
                fontSize: 27,
                fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [Text("Bonus"), SizedBox(width: 15), Text("0.0MB")],
        ),
      ),
    );
  }
}

class BuyContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final void Function()? onTap;
  const BuyContainer(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: SizeConfig.blockSizeHorizontal * 85.55,
          height: SizeConfig.blockSizeVertical * 11.25,
          //margin:EdgeInsets.all(10)
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            color: Colors.white,
          ),
          child: ListTile(
            onTap: onTap,
            minLeadingWidth: 0,
            horizontalTitleGap: 30,
            title: Text(title,
                style: TextStyle(
                    fontSize: 22,
                    color: Color.fromRGBO(20, 100, 150, 1),
                    fontWeight: FontWeight.bold)),
            subtitle: Row(
              children: [
                Icon(icon),
                SizedBox(width: SizeConfig.blockSizeHorizontal * 2.78),
                Text(subtitle),
              ],
            ),
            // trailing: Container(
            //   height: 80,
            //   width: 32,
            //   color: Colors.blueAccent,
            //   child: Icon(Icons.arrow_forward_ios_sharp,color:Colors.white),
            // ),
          ),
        ),
        Container(
          height: SizeConfig.blockSizeVertical * 11.25,
          width: SizeConfig.blockSizeHorizontal * 8.89,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: Color.fromRGBO(20, 100, 150, 1),
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios_sharp, color: Colors.white),
            onPressed: onTap,
          ),
        ),
      ],
    );
  }
}

class BuyChoiceContainer extends StatelessWidget {
  final String bundle;
  final String price;
  final void Function()? onTap;
  const BuyChoiceContainer({
    Key? key,
    required this.bundle,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: SizeConfig.blockSizeHorizontal * 85.56,
          height: SizeConfig.blockSizeVertical * 8.75,
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.white,
          ),
          child: ListTile(
              onTap: onTap,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("$bundle MB",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(20, 100, 150, 1),
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 3),
                  Container(
                    width: 80,
                    height: SizeConfig.blockSizeVertical * 3.50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(20, 100, 150, 1),
                    ),
                    child: const Center(
                        child: Text("Stay Connected",
                            style:
                                TextStyle(fontSize: 10, color: Colors.white))),
                  ),
                ],
              ),
              trailing: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromRGBO(20, 100, 150, 1),
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(5)),
                      foregroundColor: Color.fromRGBO(20, 100, 150, 1)),
                  child: Text("GHc $price"))),
        ),
        Container(
          width: SizeConfig.blockSizeHorizontal * 85.56,
          height: SizeConfig.blockSizeVertical * 3.125,
          //margin:EdgeInsets.all(10)
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            gradient: LinearGradient(
              colors: [Colors.blueGrey, Colors.white],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.5, 1],
            ),
          ),
        )
      ],
    );
  }
}

class BuyChoiceFlexiContainer extends StatelessWidget {
  final void Function()? onTap;
  const BuyChoiceFlexiContainer({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: SizeConfig.blockSizeHorizontal * 86.56,
          height: SizeConfig.blockSizeVertical * 8.75,
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.white,
          ),
          child: ListTile(
              onTap: onTap,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Flexi Bundles",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 3),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 22.22,
                    height: SizeConfig.blockSizeVertical * 3.50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.orangeAccent,
                    ),
                    child: const Center(
                        child: Text("Stay Connected",
                            style:
                                TextStyle(fontSize: 10, color: Colors.white))),
                  ),
                ],
              ),
              trailing: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.orangeAccent,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(5)),
                      foregroundColor: Colors.orangeAccent),
                  child: Text("GHc 0.03-399"))),
        ),
        Container(
          width: SizeConfig.blockSizeHorizontal * 85.56,
          height: SizeConfig.blockSizeVertical * 3.125,
          //margin:EdgeInsets.all(10)
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            gradient: LinearGradient(
              colors: [Colors.orangeAccent, Colors.amber],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.5, 1],
            ),
          ),
        )
      ],
    );
  }
}

class BuyChoiceSelf extends StatefulWidget {
  const BuyChoiceSelf({Key? key}) : super(key: key);

  @override
  State<BuyChoiceSelf> createState() => _BuyChoiceSelfState();
}

class _BuyChoiceSelfState extends State<BuyChoiceSelf> {
  String user = "user";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Buy", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.amberAccent,
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: true),
      body: Container(
        color: Color.fromRGBO(230, 230, 230, 1),
        padding: const EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            child: ListView(children: [
              Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  width: double.infinity,
                  color: Colors.white,
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                          child: Text("Buying Airtime For",
                              style: TextStyle(fontSize: 25))),
                      SizedBox(height: 20),
                      Center(
                          child: Text("0240845898",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(20, 100, 150, 1)))),
                    ],
                  )),
              const SizedBox(height: 30),
              Align(
                  alignment: Alignment.topLeft, child: Text("Payment Method")),
              const SizedBox(height: 10),
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
                  value: user,
                  activeColor: Colors.black,
                  groupValue: user,
                  //tileColor: Colors.deepOrange,
                  onChanged: (value) {
                    //other = true;
                    setState(() {
                      user = value.toString();
                    });
                  },
                  title: Text("MoMo"),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                DefaultButton(
                    onPressed: () {},
                    borderColor: Color.fromRGBO(20, 100, 150, 1),
                    foregroundColor: Color.fromRGBO(20, 100, 150, 1),
                    backgroundColor: Colors.white,
                    name: "Check Balance")
              ]),
              const SizedBox(height: 20),
              Align(
                  alignment: Alignment.topLeft,
                  child: const Text("Enter amount to buy")),
              const SizedBox(height: 10),
              const DefaultTextInput(
                hintText: '',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DefaultButton_2(
                    onPressed: () {},
                    borderColor: Color.fromRGBO(20, 100, 150, 1),
                    backgroundColor: Color.fromRGBO(20, 100, 150, 1),
                    foregroundColor: Colors.white,
                    name: "Buy",
                    icon: Icon(Icons.arrow_forward),
                  ),
                ],
              )
            ]),
          )
        ]),
      ),
    );
  }
}
