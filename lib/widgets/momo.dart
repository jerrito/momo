import 'package:flutter/material.dart';

class MomoContainer extends StatelessWidget {
 final void Function() onPressed;
 final void Function() onPressed_2;
 final String name;
 final IconData icon;
 final IconData icon_1;
 final String name_2;
  const MomoContainer({Key? key,required this.onPressed, required this.name,
    required this.onPressed_2, required this.name_2, required this.icon, required this.icon_1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width:120,height:130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            shape:BoxShape.rectangle,
            color:Colors.white,
          ),
          child: TextButton.icon(onPressed:onPressed,
              icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Icon(icon,size: 40,color:Color.fromRGBO(20, 100, 150, 1)),
                    SizedBox(height:10),
                    Text(name,style:TextStyle(fontSize:12,color:Color.fromRGBO(20, 100, 150, 1)))
                  ]
              ), label: Text("")),

        ),
        Container(
          width:120,height:130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            shape:BoxShape.rectangle,
            color:Colors.white,
          ),
          child: TextButton.icon(onPressed: onPressed_2,
              icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Icon(icon_1,size: 40,color:Color.fromRGBO(20, 100, 150, 1)),
                    SizedBox(height:10),
                    Text(name_2,style:TextStyle(fontSize:12,color:Color.fromRGBO(20, 100, 150, 1)))
                  ]
              ), label: Text("")),

        ),
      ],
    );
  }
}
