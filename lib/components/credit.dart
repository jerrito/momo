import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo/Size_of_screen.dart';


class Credit extends StatelessWidget {
  final IconData? icon;
  final String Texts;
  final String text;
  const Credit({Key? key, this.icon, required this.Texts, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Container(
      width: double.infinity,height:SizeConfig.blockSizeVertical*10,
      margin:EdgeInsets.all(10) ,padding:EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ListTile(
        leading: Column(
            children: [
             Text(text),
              SizedBox(height: SizeConfig.blockSizeVertical*0.65),
              Icon(icon,color: Colors.amber,size: 32,)
            ]),
        title:Text(Texts,style:TextStyle(color:Color.fromRGBO(20, 100, 150, 1),
            fontSize: 27,fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            Text("Bonus"),
            SizedBox(width:15),
            Text("0.0MB")
          ],
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
  const BuyContainer({Key? key, required this.title, required this.subtitle, required this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: SizeConfig.blockSizeHorizontal*85.55,height: SizeConfig.blockSizeVertical*11.25,
          //margin:EdgeInsets.all(10)
          padding:EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft:
            Radius.circular(10),bottomLeft:
            Radius.circular(10)),
            color: Colors.white,
          ),
          child: ListTile(
            onTap: onTap,
            minLeadingWidth: 0,
            horizontalTitleGap: 30,
            title: Text(title,style:TextStyle(fontSize: 22,
            color:Color.fromRGBO(20, 100, 150, 1),fontWeight: FontWeight.bold)),
            subtitle: Row(
              children: [
                Icon(icon),
                SizedBox(width:SizeConfig.blockSizeHorizontal*2.78),
                Text(subtitle),
              ],
            ),
            // trailing: Container(
            //   height: 80,
            //   width: 32,
            //   color: Colors.blueAccent,
            //   child: Icon(Icons.arrow_forward_ios_sharp,color:Colors.white),
            // ),
          ),),
        Container(
          height: SizeConfig.blockSizeVertical*11.25,
          width: SizeConfig.blockSizeHorizontal*8.89,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight:
            Radius.circular(10),bottomRight:
            Radius.circular(10)),
            color: Color.fromRGBO(20, 100, 150, 1),
          ),

          child: IconButton(icon:Icon(Icons.arrow_forward_ios_sharp,color:Colors.white),
            onPressed:onTap,),
        ),
      ],);}
}


class BuyChoiceContainer extends StatelessWidget {
  final String bundle;
  final String price;
  final void Function()? onTap;
  const BuyChoiceContainer({Key? key, required this.bundle, required this.price,required this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: SizeConfig.blockSizeHorizontal*85.56,height: SizeConfig.blockSizeVertical*8.75,
          padding:EdgeInsets.only(top:10),
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.only(topLeft:Radius.circular(10),
                topRight:Radius.circular(10)),
            color: Colors.white,),
          child: ListTile(
            onTap: onTap,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("$bundle MB",style:TextStyle(fontSize: 20,
                      color:Color.fromRGBO(20, 100, 150, 1),fontWeight: FontWeight.bold)),
                  SizedBox(height:3),
                  Container(
                    width:80,height: SizeConfig.blockSizeVertical*3.75,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color:Color.fromRGBO(20, 100, 150, 1),
                    ),
                    child: const Center(child: Text("Stay Conncected",style:TextStyle(fontSize: 10,color:Colors.white))),
                  ),
                ],
              ),

              trailing:OutlinedButton(onPressed: (){

              }, style: OutlinedButton.styleFrom(
                  shape:RoundedRectangleBorder(
                      side:BorderSide(color:Color.fromRGBO(20, 100, 150, 1),width:2,style:BorderStyle.solid),
                      borderRadius: BorderRadius.circular(5)),
                  foregroundColor:Color.fromRGBO(20, 100, 150, 1)),

                  child: Text("GHc $price"))
          ),),
        Container(
          width: SizeConfig.blockSizeHorizontal*85.56,height: SizeConfig.blockSizeVertical*3.125,
          //margin:EdgeInsets.all(10)
          padding:EdgeInsets.only(top:10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),
                bottomRight:Radius.circular(10)),
            gradient: LinearGradient(colors: [Colors.blueGrey,Colors.white],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.5, 1],
            ),),
        )
      ],
    );

  }
}

class BuyChoiceFlexiContainer extends StatelessWidget {

  final void Function()? onTap;
  const BuyChoiceFlexiContainer({Key? key,required this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width:SizeConfig.blockSizeHorizontal*85.56,height: SizeConfig.blockSizeVertical*8.75,
          padding:EdgeInsets.only(top:10),
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.only(topLeft:Radius.circular(10),
                topRight:Radius.circular(10)),
            color: Colors.white,),
          child: ListTile(
              onTap: onTap,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Flexi Bundles",style:TextStyle(fontSize: 20,
                      color:Colors.orangeAccent,fontWeight: FontWeight.bold)),
                  SizedBox(height:3),
                  Container(
                    width:SizeConfig.blockSizeHorizontal*22.22,height: SizeConfig.blockSizeVertical*3.75,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color:Colors.orangeAccent,
                    ),
                    child: const Center(child: Text("Stay Conncected",style:TextStyle(fontSize: 10,color:Colors.white))),
                  ),
                ],
              ),

              trailing:OutlinedButton(onPressed: (){

              }, style: OutlinedButton.styleFrom(
                  shape:RoundedRectangleBorder(
                      side:BorderSide(color:Colors.orangeAccent,width:2,style:BorderStyle.solid),
                      borderRadius: BorderRadius.circular(5)),
                  foregroundColor:Colors.orangeAccent),

                  child: Text("GHc 0.03-399"))
          ),),
        Container(
          width: SizeConfig.blockSizeHorizontal*85.56,height: SizeConfig.blockSizeVertical*3.125,
          //margin:EdgeInsets.all(10)
          padding:EdgeInsets.only(top:10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),
                bottomRight:Radius.circular(10)),
            gradient: LinearGradient(colors: [Colors.orangeAccent,Colors.amber],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.5, 1],
            ),),
        )
      ],
    );

  }
}


