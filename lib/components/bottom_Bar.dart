import 'package:flutter/material.dart';
import 'package:momo/components/button_input.dart';

class BottomAppBar extends StatelessWidget {
  final Color? color_1;
  final Color? color_2;
  final Color? color_3;
  final Color? color_4;

  const BottomAppBar({Key? key,this.color_1, this.color_2, this.color_3, this.color_4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(onPressed:(){

            Navigator.pushNamed(context, 'momoHomePage');
          } ,icon: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Icon(Icons.home_outlined,size: 32,color:color_1),
              Text("Home",style:TextStyle(fontSize: 12,color:color_1))
            ],
          ), label:Text("") ,style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
          )),
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: TextButton.icon(onPressed:(){
              Navigator.pushNamed(context, 'credit');
            } ,icon: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.shopping_cart_outlined,size: 32,color:color_2),
                Text("Buy/Send",style:TextStyle(fontSize: 12,color:color_2))
              ],
            ), label:Text("") ,style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
            )),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right:8.0),
          //   child: IconButton(
          //     icon:Icon(Icons.shopping_cart_outlined,size: 32,color:color_2),
          //     tooltip: 'Open shopping cart',
          //     onPressed: () {
          //      Navigator.pushNamed(context, 'credit');
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left:35.0),
            child: TextButton.icon(onPressed:(){
              Navigator.pushNamed(context, 'just4u');
            } ,icon: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.shopping_bag_outlined,size: 32,color:color_3),
                Text("just4u",style:TextStyle(fontSize: 12,color:color_3))
              ],
            ), label:Text("") ,
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
            ),),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left:30.0),
          //   child: IconButton(
          //     icon: Icon(Icons.shopping_bag_outlined,size: 32,color:color_3),
          //     tooltip: 'Open shopping cart',
          //     onPressed: () {
          //       Navigator.pushNamed(context, 'just4u');
          //     },
          //   ),
          // ),
           TextButton.icon(onPressed:(){
             Navigator.pushNamed(context, 'more');
            } ,icon: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.more_outlined,size: 32,color:color_4),
                Text("Get More",style:TextStyle(fontSize: 12,color:color_4))
              ],
            ), label:Text("") ,style: ButtonStyle(
             foregroundColor: MaterialStateProperty.all(Colors.black),
           )),


          // IconButton(
          //   icon:  Icon(Icons.more_outlined,color:color_4),
          //   tooltip: 'Open shopping cart',
          //   onPressed: () {
          //     Navigator.pushNamed(context, 'more');
          //   },
          // ),

        ],
      ),
    );
  }
}

class FloatingAction extends StatelessWidget {
  const FloatingAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black54,width: 2,style:BorderStyle.solid)
      ),
      child: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'momo'); },
        backgroundColor: Colors.white,

        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: Image.asset("./assets/images/momo_2.png").image)
          ),
        ),),
    );
  }
}


class BottomAppBar_2 extends StatelessWidget {
  final void Function() onPressed;
  final void Function() onPressed_2;
  final Color? backgroundColor;
  final Color? backgroundColor_2;
  final Color? foregroundColor;
  final Color? foregroundColor_2;
  final Color borderColor;
  final Color borderColor_2;
  final String name;
  final Icon icon;
  final String name_2;
  const BottomAppBar_2({Key? key, required this.onPressed, this.backgroundColor, this.foregroundColor, required this.borderColor, required this.name, required this.onPressed_2, this.backgroundColor_2, this.foregroundColor_2, required this.borderColor_2, required this.name_2, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 150,height: 50,
            child: DefaultButton(onPressed: onPressed, borderColor: borderColor,
                backgroundColor: backgroundColor,foregroundColor: foregroundColor,name: name),
          )
          ,SizedBox(width: 150,height: 50,
            child: DefaultButton_2(onPressed: onPressed_2, borderColor: borderColor_2,
                backgroundColor: backgroundColor_2,foregroundColor: foregroundColor_2,name: name_2, icon: icon,),
          )

        ]

    ));
  }
}
