import 'package:flutter/material.dart';
import 'package:momo/pages/Screen.dart';

class RecipientNetwork extends StatelessWidget {
  static const String routeName="/recipientNetwork";
  const RecipientNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return MomoScreen(
      title: const Text("Recipient",
          style: TextStyle(
          color: Colors.black)),
      body:Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromRGBO(230, 230, 230, 1),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            const SizedBox(height:70),
            InkWell(
              onTap:(){
                Navigator.pushNamed(context, "recipient");
              },
              child: Container(
                width:double.infinity,height: 150,
                decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                  image: DecorationImage(
                  image:  Image.asset("./assets/images/m4.png",
                    width:double.infinity,height: 150,).image,                )
                ),
              ),
            ),
            const SizedBox(height:40),
            InkWell(
              onTap:(){
                //Navigator.pushNamed(context, "recipient");
              },
              child: Container(
                width:double.infinity,height: 150,
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(10),
                    image: DecorationImage(
                      image:  Image.asset("./assets/images/m5.png",
                        width:double.infinity,height: 150,).image,                )
                ),
              ),
            )
          ]
        )
      )
    );
  }
}
