import 'package:flutter/material.dart';

class DefaultTextInput extends StatelessWidget {
   final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType? keyboardType;
  const DefaultTextInput({Key? key, this.onChanged, this.validator, required this.hintText,
    this.keyboardType, this.controller, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0,bottom: 10),
      child: SizedBox(
        width:double.infinity,height: 50,
        child: TextFormField(
          controller: controller,
          onChanged:onChanged ,
          validator:validator ,
          keyboardType: keyboardType,
          // obscureText: true,
          // obscuringCharacter: obscuringCharacter,
          decoration: InputDecoration(
            filled: true,
              fillColor: Colors.white,
              enabledBorder:OutlineInputBorder(
                  borderSide:const BorderSide(color:Colors.black54,width:2,style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20)
              ),
              focusedBorder:OutlineInputBorder(
                  borderSide:const BorderSide(color:Colors.black54,width:2,style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20)
              ),
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 4,color: Colors.amberAccent,style: BorderStyle.solid)
            )
          ),




        ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color borderColor;
  final String name;
  const DefaultButton({Key? key,required this.onPressed, this.backgroundColor, this.foregroundColor,required this.borderColor, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
         backgroundColor:backgroundColor ,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color:borderColor,width:3,style: BorderStyle.solid)
          )
        ),
        child: Text(name));
  }
}

class DefaultButton_2 extends StatelessWidget {
  final void Function() onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color borderColor;
  final Icon icon;
  final String name;
  const DefaultButton_2({Key? key,required this.onPressed, this.backgroundColor, this.foregroundColor,required this.borderColor, required this.name, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor:backgroundColor ,
            foregroundColor: foregroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color:borderColor,width:3,style: BorderStyle.solid)
            )
        ),
        icon: icon,
        label: Text(name));
  }
}
