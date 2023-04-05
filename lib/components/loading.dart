import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  const Loading({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: AlertDialog(
        backgroundColor: Colors.black,
        content: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:const [
              CircularProgressIndicator(color:Color.fromRGBO(20, 100, 150, 1)),
              Text("Processing",style:TextStyle(color:Colors.white)),
            ]),
      ),
    );
  }
}
class Snack extends StatelessWidget {
  final String message;
  const Snack({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SnackBar(duration: Duration(seconds: 5),
      content: Text(message,style:TextStyle(color:Colors.white)),
      backgroundColor: Color.fromRGBO(20, 100, 150, 1),);

  }
}

