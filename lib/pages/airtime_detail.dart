import 'package:flutter/material.dart';
import 'package:momo/pages/Screen.dart';
import 'package:momo/main.dart';
import '../widgets/bottom_Bar.dart';

class AirtimeDetails extends StatefulWidget{
  static const String routeName="/momoPage";
  const AirtimeDetails({Key? key}) : super(key: key);

  @override
 State<AirtimeDetails> createState()=> _AirtimeDetails();
}

class _AirtimeDetails extends State<AirtimeDetails>{
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2,
      child: MomoScreen(
        key:_scaffoldKey,
        title: const Text("Airtime details", style: TextStyle(color: Colors.black)),
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
          name: "Send",
          onPressed: () {},
          borderColor_2: const Color.fromRGBO(20, 100, 150, 1),
          name_2: "Buy",
          onPressed_2: () {
            setState(() {
              floatButtonActive=false;
              buttonIndex = 1;
              Navigator.pushNamed(context, 'credit');
            });
            },
          backgroundColor_2: const Color.fromRGBO(20, 100, 150, 1),
          icon: const Icon(Icons.arrow_forward),
        ),
        body:Column(
          children:[
            SizedBox(height:15),
            const Text("Total Airtime"),
            const Text("GHc4.4",style:TextStyle(
                color:Color.fromRGBO(20, 100, 150, 1),
              fontSize:24,
              fontWeight:FontWeight.bold
            )),
            const ListTile(
              title: Text("GHc4.4",style:TextStyle(
                color:Color.fromRGBO(20, 100, 150, 1),)),
              trailing: Text("LifeTime \nvalidity"),
              subtitle: Text("Airtime"),
            ),
            const TabBar(tabs:
            [Tab(child: Text("Airtime Used",
            style:TextStyle(
              color:Colors.black
            ))),
            Tab(child: Text("Airtime Bought",
                style:TextStyle(
                    color:Colors.black
                ))),
            ],
            indicatorColor: Colors.black,),
            SingleChildScrollView(
              child: SizedBox(
                height:400,
                child: TabBarView(children: [
                  Container(
                    padding:const EdgeInsets.all(10),
                    decoration:BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ListView.builder(
                      itemCount: 20,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index) {
                        return const ListTile(
                          title: Text("233597048845"),
                          trailing: Text("GHc0.0"),
                          subtitle: Text("27 Aug 2023"),
                        );
                      }
                    ),
                  ),
                  const Text("No call charge history to report yet")
                ]),
              ),
            )
          ]
        )
      ),
    );
  }
}