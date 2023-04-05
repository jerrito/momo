import'package:flutter/material.dart';
import 'package:momo/Size_of_screen.dart';
import 'package:momo/components/bottom_Bar.dart' as bottoms;
import 'package:momo/components/momo.dart' ;
import 'package:momo/components/button_input.dart' ;
import 'package:momo/Screen.dart';


class momoPage extends StatefulWidget {
  const momoPage({Key? key}) : super(key: key);

  @override
  State<momoPage> createState() => _momoPageState();
}

class _momoPageState extends State<momoPage> {
  @override
  Widget build(BuildContext context) {
    return MomoScreen(
      title:Text("MoMo",style:TextStyle(color:Colors.black)),
        floatingAction:const bottoms.FloatingAction(),
      bottomNavigationBar: const BottomAppBar(
        child: bottoms.BottomAppBar(),),
      body: SingleChildScrollView(
        child: Container(
            color: const Color.fromRGBO(230, 230, 230, 1),
          padding: EdgeInsets.all(16),
        child:  Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color:Colors.white,shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color:Color.fromRGBO(20, 100, 150, 1), borderRadius: BorderRadius.only(topRight:Radius.circular(10),
                              bottomRight:Radius.circular(10))),width: 4,height: 70,),
                        Column(
                          children: [TextButton.icon(onPressed:(){}, icon: Icon(Icons.phone_android,color:Colors.grey),
                              label: Text("Momo Balance",style:TextStyle(color:Color.fromRGBO(20, 100, 150, 1))), ),
                            Divider(color: Colors.amber,thickness: 2,),
                            Text("GHC 12",style:TextStyle(color:Colors.black,fontSize: 24,fontWeight: FontWeight.bold))
                          ],),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(90.0,8,0,0),
                          child: Container(
                            height: SizeConfig.blockSizeVertical*10,width: SizeConfig.blockSizeHorizontal*22.22,
                            decoration: BoxDecoration(
                                //color: Colors.amberAccent,
                                shape: BoxShape.rectangle,
                                //image: DecorationImage(image: image),
                                borderRadius: BorderRadius.circular(10),
                                border:Border.all(width: 1,color:Colors.amber,style: BorderStyle.solid)
                            ),
                              child:Container(

                                child: TextButton.icon(onPressed:(){
                                  Navigator.pushNamed(context, 'credit');
                                } ,icon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: SizeConfig.blockSizeHorizontal*8.89,height:32,
                                        decoration:  BoxDecoration(
                                          //color: Colors.amberAccent,
                                            shape: BoxShape.rectangle,
                                           // image: DecorationImage(image:AssetImage("./assets/images/qr-code (2).png")),
                                            borderRadius: BorderRadius.circular(10),
                                           border:Border.all(width: 3,color:Colors.amber,style: BorderStyle.solid)
                                        ),
                                        child: Image.asset("./assets/images/qr-code (2).png",width:20,height:20)
                                    ),
                                    Text("MoMo Pay",style:TextStyle(fontSize: 10,color:Color.fromRGBO(20, 100, 150, 1)))
                                  ],
                                ), label:Text("") ,style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(Colors.black),
                                )),
                              ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height:37),
                    Container(
                      height: SizeConfig.blockSizeVertical*6.25,
                      width:double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.amberAccent,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("./assets/images/momo_2.png"),
                          Text("Download the Momo App for more",style:TextStyle(color:Color.fromRGBO(20, 100, 150, 1),fontSize: 14)),
                          Icon(Icons.arrow_forward,color:Color.fromRGBO(20, 100, 150, 1))
                        ],),)
                  ],),),
              SizedBox(height:20),
              const Center(child:Text("MoMo Services",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold))),
              SizedBox(height:30),
              MomoContainer(onPressed: (){Navigator.pushNamed(context, "momo_2");}, name: "Transfer Money", icon: Icons.add_box_sharp ,
                onPressed_2: () {}, name_2: 'Cashout', icon_1: Icons.add,),
              SizedBox(height:10),
              MomoContainer(onPressed: (){}, name: "Airtime",icon:Icons.add_box_sharp,
                onPressed_2: () {  }, name_2: 'Bank statement',  icon_1: Icons.ac_unit_outlined,),
              SizedBox(height:10),
              MomoContainer(onPressed: (){}, name: "Pay Bill", icon:Icons.shopping_cart_outlined,
                onPressed_2: () {  }, name_2: 'REPORT Momo \nFraud',  icon_1: Icons.ac_unit_outlined,),
              SizedBox(height:10),
              MomoContainer(onPressed: (){}, name: "My Wallet", icon:Icons.add_box_sharp,
                onPressed_2: () {  }, name_2: 'Approvals',icon_1:Icons.add_box_sharp,),

          ],
          )

        ),
      ),
    );
  }
}
class MomoPage_2 extends StatelessWidget {
  const MomoPage_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
        title:Text("Transfer",style:TextStyle(color:Colors.black)),


    body:Container(
    color: const Color.fromRGBO(230, 230, 230, 1),
    padding: EdgeInsets.all(16),
    child:  Column(mainAxisAlignment: MainAxisAlignment.start,
    children:[
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child:Text("Transfer Money",
            style:TextStyle(color:Colors.black,fontSize: 23))),
      ),
      MomoContainer(onPressed: (){
        Navigator.pushNamed(context, 'momo_3');
      }, name: "Momo User",icon: Icons.transfer_within_a_station_outlined,
          onPressed_2: (){}, name_2: "Other Networks",  icon_1: Icons.ad_units_rounded),
      SizedBox(height:10),
      MomoContainer(onPressed: (){}, name: "Non-Momo User",icon: Icons.transfer_within_a_station_outlined,
          onPressed_2: (){}, name_2: "Scheduled\nTransfer",  icon_1: Icons.ad_units_rounded)



    ])
    ));
  }
}

class MoMo_3 extends StatelessWidget {
  const MoMo_3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
        title:Text("Transfer",style:TextStyle(color:Colors.black)),


        body:Container(
        color: const Color.fromRGBO(230, 230, 230, 1),
    padding: EdgeInsets.all(16),
    child:  Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
    children:[SizedBox(height: 50,),
        Center(child:Text("Transfer(MoMo)",
        style:TextStyle(color:Colors.black,fontSize: 23,fontWeight: FontWeight.bold))),
      SizedBox(height: 20,),
      Text("MoMo Number", style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
      SizedBox(width: SizeConfig.blockSizeHorizontal*69.44,
          child: DefaultTextInput(hintText: 'Enter Number',)),
      SizedBox(height: 20,),
      Text("Enter amount to transfer", style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
      DefaultTextInput(hintText: '00.00',),
      SizedBox(height: 20,),
      Text("Enter Reference", style:TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
      DefaultTextInput(hintText: 'Eg. Paying for Rice',),





    ])),
      bottomNavigationBar: bottoms.BottomAppBar_2(
        backgroundColor: Colors.white,foregroundColor: Colors.black,
          borderColor:Colors.black,name: "Back",onPressed:(){} ,
          borderColor_2:Color.fromRGBO(20, 100, 150, 1),name_2:"Proceed" ,
        onPressed_2:(){Navigator.pushNamed(context, "momo_4");} ,backgroundColor_2: Color.fromRGBO(20, 100, 150, 1),icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}


class MoMo_4 extends StatelessWidget {
  const MoMo_4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MomoScreen(
        title:Text("Transfer",style:TextStyle(color:Colors.black)),
        body:Container(
        color: const Color.fromRGBO(230, 230, 230, 1),
    padding: EdgeInsets.all(10),
    child:  Column(mainAxisAlignment: MainAxisAlignment.start,
    children:[
      SizedBox(height: SizeConfig.blockSizeVertical*6.25,),
      Center(child:Text("Confirmation",
          style:TextStyle(color:Colors.black,fontSize: 25,letterSpacing: 1.2,fontWeight: FontWeight.bold))),
      SizedBox(height: SizeConfig.blockSizeVertical*2.5),
    Center(child:Text("You are transferring to:", style:TextStyle(color:Colors.black,letterSpacing: 1.2,fontSize: 20,))),
      SizedBox(height: SizeConfig.blockSizeVertical*2.5,),
    Center(child:Text("Jerry Boateng",
        style:TextStyle(color:Colors.black,letterSpacing: 1.2,fontSize: 20,fontWeight: FontWeight.bold))),
    Center(child:Text("0240858585",
        style:TextStyle(color:Colors.black,letterSpacing: 1.2,fontSize: 20,fontWeight: FontWeight.bold))),
      SizedBox(height:SizeConfig.blockSizeVertical*2.5,),
      Row(
        children: [
          Container( width:SizeConfig.blockSizeHorizontal*88.89,height: 100,
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(10),
                  bottomLeft:Radius.circular(10)),
              color:Colors.white,
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(text:TextSpan(text:"Transfer Money ",style: TextStyle(color:Colors.black),
                  children: [
                    TextSpan(text:'\n\nGHc 0.5',style:
                    TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Color.fromRGBO(20, 100, 150, 1)))
                  ])),
                ),
                //Text("GHc 0.5"),
                VerticalDivider(width: 10,thickness: 1,color: Colors.grey,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Reference:\n1"),
                ),
              ],
            )
          ),
          Container(
            width:SizeConfig.blockSizeHorizontal*5.5,height: SizeConfig.blockSizeVertical*12.5,
            decoration: const BoxDecoration(
              borderRadius:  BorderRadius.only(topRight:Radius.circular(10),
                  bottomRight:Radius.circular(10)),
              color:Colors.black54,
            ),
          )
        ],
      ),



    ])),
      bottomNavigationBar: bottoms.BottomAppBar_2(
    backgroundColor: Colors.white,foregroundColor: Colors.black,
      borderColor:Colors.black,name: "Back",onPressed:(){} ,
      borderColor_2:Color.fromRGBO(20, 100, 150, 1),name_2:"Proceed" ,
      onPressed_2:(){Navigator.pushNamed(context, "momo_4");} ,backgroundColor_2: Color.fromRGBO(20, 100, 150, 1),icon: Icon(Icons.arrow_forward),
    ),
    );
  }
}
