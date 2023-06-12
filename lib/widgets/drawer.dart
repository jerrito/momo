import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoMoDrawer extends StatelessWidget {
  final Function() onPressed;
  const MoMoDrawer({Key? key,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: double.infinity,
        child: Column(

          children: [
            AppBar(
              // backgroundColor: Colo,
              backgroundColor: Colors.amber[400],
              title:Text("Menu",style: TextStyle(color:Colors.black)),
              centerTitle: true,
              leading: Image.asset('./assets/images/images.png',width: 30,height: 30,),
              actions:[IconButton(icon: SvgPicture.asset("./assets/svgs/x.svg"),
                onPressed:onPressed, //() {  //authenticate();//_scaffoldKey.currentState?.closeDrawer();}
                ),],
            ),
            SizedBox(height:25),
            Flexible(
                child: ListView(
                    children: [
                      Container(
                        height: 60,width:100,
                        decoration: BoxDecoration(
                          //image:SvgPicture.asset("./assets/svgs/x.svg",width: 40,),
                            color:Colors.grey,shape: BoxShape.circle),
                        child: IconButton(onPressed: (){},
                            icon: Icon(Icons.person,size:50,color:Colors.white)),
                      ),

                      Center(child: Text("Jerry",style: TextStyle(fontSize:23,fontWeight:FontWeight.bold),)),
                      Center(child: Text("Boateng",style: TextStyle(fontSize:23,fontWeight:FontWeight.bold))),
                      Divider(
                        height: 20,
                        color: Colors.grey,thickness: 2,
                      ),
                      ListTile(leading: Icon(Icons.home,color:Colors.amber[400]),title: Text("Home"),),
                      ListTile(leading: Icon(Icons.sim_card,color:Colors.amber[400]),title: Text("Sim Registration"),),
                      ListTile(leading: Icon(Icons.sim_card_outlined,color:Colors.amber[400],size:40),title: Text("eSim"),),
                      ListTile(leading: Icon(Icons.add,color:Colors.amber[400]),title: Text("Bill Summary"),),
                      ListTile(leading: Icon(Icons.add,color:Colors.amber[400]),title: Text("Bill Pay"),),
                      ListTile(leading: Icon(Icons.history,color:Colors.amber[400],size:37),title: Text("Account History"),),
                      ListTile(leading: Icon(Icons.home,color:Colors.amber[400]),title: Text("Requested BroadBand"),),
                      ListTile(leading: Icon(Icons.add,color:Colors.amber[400]),title: Text("Subscrptions"),),
                      ListTile(leading: Icon(Icons.person_outlined,color:Colors.amber[400]),title: Text("Profile"),),
                      ListTile(leading: Icon(Icons.add,color:Colors.amber[400]),title: Text("Report MoMo fraud"),),
                      ListTile(leading: SvgPicture.asset('./assets/svgs/star.svg',color:Colors.amber[400]),title: Text("Rate app experience"),),
                      ListTile(leading: Icon(Icons.help_outlined,color:Colors.amber[400]),title: Text("Help"),),
                      ListTile(leading: Icon(Icons.home,color:Colors.amber[400],size:35),title: Text("Switch to Consumer MoMo"),),
                      ListTile(onTap: (){
                        Navigator.pushNamed(context, 'login');
                      },leading: Icon(Icons.person_add_alt,color:Colors.amber[400]),title: Text("Logout"),),
                    ])),
          ],
        )

    );
  }
}
