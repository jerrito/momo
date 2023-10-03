import 'package:flutter/material.dart';
import 'package:momo/widgets/button_input.dart';
import 'package:momo/main.dart';

class BottomAppBarMain extends StatefulWidget {
  final Color? color_1;
  final Color? color_2;
  final Color? color_3;
  final Color? color_4;

  const BottomAppBarMain(
      {Key? key, this.color_1, this.color_2, this.color_3, this.color_4})
      : super(key: key);

  @override
  State<BottomAppBarMain> createState() => _BottomAppBarMainState();
}

class _BottomAppBarMainState extends State<BottomAppBarMain> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor:!floatButtonActive? Colors.amber:Colors.black,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedLabelStyle:const TextStyle(
                color:Colors.black),
            selectedLabelStyle:TextStyle(
                color:!floatButtonActive?Colors.amber:Colors.black),
            onTap: (index) {
              if (index == 0) {
                setState(() {
                  floatButtonActive=false;
                  buttonIndex = index;
                  Navigator.pushNamed(context, 'momoHomePage');
                });
              } else if (index == 1) {
                setState(() {
                  floatButtonActive=false;
                  buttonIndex = index;
                  Navigator.pushNamed(context, 'credit');
                });
              } else if (index == 2) {
                setState(() {
                  floatButtonActive=false;
                  buttonIndex = index;
                  Navigator.pushNamed(context, 'just4u');
                });
              } else if (index == 3) {
                setState(() {
                  floatButtonActive=false;
                  buttonIndex = index;
                  Navigator.pushNamed(context, 'more');
                });
              }
            },
            currentIndex: buttonIndex,
            items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 32, color: widget.color_1),
              label: "Home",
              activeIcon:
                  Icon(Icons.home_outlined, size: 32, color: widget.color_1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,
                  size: 32, color: widget.color_2),
              label: "BUY/SEND",
              activeIcon: Icon(Icons.shopping_cart_outlined,
                  size: 32, color: widget.color_1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined,
                  size: 32, color: widget.color_3),
              label: "JUST4U",
              activeIcon: Icon(Icons.shopping_bag_outlined,
                  size: 32, color: widget.color_1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_outlined, size: 32, color: widget.color_4),
              label: "Get More",
              activeIcon:
                  Icon(Icons.more_outlined, size: 32,
                      color:!floatButtonActive?Colors.amber: Colors.black)),
        ])
        // return  SizedBox(
        //   height: 70,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       TextButton.icon(onPressed:(){
        //
        //         Navigator.pushNamed(context, 'momoHomePage');
        //       } ,icon: Column(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //            Icon(Icons.home_outlined,size: 32,color:color_1),
        //           Text("Home",style:TextStyle(fontSize: 12,color:color_1))
        //         ],
        //       ), label:Text("") ,style: ButtonStyle(
        //         foregroundColor: MaterialStateProperty.all(Colors.black),
        //       )),
        //       Padding(
        //         padding: const EdgeInsets.only(right:8.0),
        //         child: TextButton.icon(onPressed:(){
        //           Navigator.pushNamed(context, 'credit');
        //         } ,icon: Column(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             Icon(Icons.shopping_cart_outlined,size: 32,color:color_2),
        //             Text("Buy/Send",style:TextStyle(fontSize: 12,color:color_2))
        //           ],
        //         ), label:Text("") ,style: ButtonStyle(
        //           foregroundColor: MaterialStateProperty.all(Colors.black),
        //         )),
        //       ),
        //       // Padding(
        //       //   padding: const EdgeInsets.only(right:8.0),
        //       //   child: IconButton(
        //       //     icon:Icon(Icons.shopping_cart_outlined,size: 32,color:color_2),
        //       //     tooltip: 'Open shopping cart',
        //       //     onPressed: () {
        //       //      Navigator.pushNamed(context, 'credit');
        //       //     },
        //       //   ),
        //       // ),
        //       Padding(
        //         padding: const EdgeInsets.only(left:35.0),
        //         child: TextButton.icon(onPressed:(){
        //           Navigator.pushNamed(context, 'just4u');
        //         } ,icon: Column(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             Icon(Icons.shopping_bag_outlined,size: 32,color:color_3),
        //             Text("just4u",style:TextStyle(fontSize: 12,color:color_3))
        //           ],
        //         ), label:Text("") ,
        //         style: ButtonStyle(
        //             foregroundColor: MaterialStateProperty.all(Colors.black),
        //         ),),
        //       ),
        //       // Padding(
        //       //   padding: const EdgeInsets.only(left:30.0),
        //       //   child: IconButton(
        //       //     icon: Icon(Icons.shopping_bag_outlined,size: 32,color:color_3),
        //       //     tooltip: 'Open shopping cart',
        //       //     onPressed: () {
        //       //       Navigator.pushNamed(context, 'just4u');
        //       //     },
        //       //   ),
        //       // ),
        //        TextButton.icon(onPressed:(){
        //          Navigator.pushNamed(context, 'more');
        //         } ,icon: Column(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             Icon(Icons.more_outlined,size: 32,color:color_4),
        //             Text("Get More",style:TextStyle(fontSize: 12,color:color_4))
        //           ],
        //         ), label:Text("") ,style: ButtonStyle(
        //          foregroundColor: MaterialStateProperty.all(Colors.black),
        //        )),
        //
        //
        //       // IconButton(
        //       //   icon:  Icon(Icons.more_outlined,color:color_4),
        //       //   tooltip: 'Open shopping cart',
        //       //   onPressed: () {
        //       //     Navigator.pushNamed(context, 'more');
        //       //   },
        //       // ),
        //
        //     ],
        //   ),
        // )
        ;
  }
}

class FloatingAction extends StatefulWidget {
  const FloatingAction({Key? key}) : super(key: key);

  @override
  State<FloatingAction> createState() => _FloatingActionState();
}

class _FloatingActionState extends State<FloatingAction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.black54, width: 2, style: BorderStyle.solid)),
      child: FloatingActionButton(
        onPressed: () {
          setState((){
            buttonIndex=3;
            floatButtonActive=true;
          }
          );
          Navigator.pushNamed(context, 'momo');
        },
        backgroundColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: Image.asset("./assets/images/m3.png").image)),
        ),
      ),
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
  const BottomAppBar_2(
      {Key? key,
      required this.onPressed,
      this.backgroundColor,
      this.foregroundColor,
      required this.borderColor,
      required this.name,
      required this.onPressed_2,
      this.backgroundColor_2,
      this.foregroundColor_2,
      required this.borderColor_2,
      required this.name_2,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            width: 150,
            height: 50,
            child: DefaultButton(
                onPressed: onPressed,
                borderColor: borderColor,
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                name: name),
          ),
          SizedBox(
            width: 150,
            height: 50,
            child: DefaultButton_2(
              onPressed: onPressed_2,
              borderColor: borderColor_2,
              backgroundColor: backgroundColor_2,
              foregroundColor: foregroundColor_2,
              name: name_2,
              icon: icon,
            ),
          )
        ]));
  }
}
