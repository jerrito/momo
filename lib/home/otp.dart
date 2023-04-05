import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:phone_auth_handler_demo/screens/home_screen.dart';
// import 'package:phone_auth_handler_demo/utils/helpers.dart';
// import 'package:phone_auth_handler_demo/widgets/custom_loader.dart';
// import 'package:phone_auth_handler_demo/widgets/pin_input_field.dart';
import 'package:momo/components/button_input.dart';
import 'package:momo/Screen.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:telephony/telephony.dart';

class Number extends StatefulWidget {
  const Number({Key? key}) : super(key: key);

  @override
  State<Number> createState() => _NumberState();
}
class _NumberState extends State<Number> {
  final FirebaseAuth _auth=FirebaseAuth.instance;

  TextEditingController number=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MomoScreen(
      body:Container(
        padding: EdgeInsets.all(10),
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Center(
              child:DefaultTextInput(hintText: '0244444444',
                controller: number,
                keyboardType:TextInputType.number
              )),
              SizedBox(height:40),
              SizedBox(width:double.infinity,height:60,
                child: DefaultButton(onPressed:()async{  await phoneSignIn(phoneNumber: "+233${number.text.substring(1)}");},
                 backgroundColor: Colors.amberAccent,foregroundColor: Colors.black,   borderColor:Colors.amberAccent, name: "Verify"),
              )

          ],
        )
      )
    );
  }
  Future<void> phoneSignIn({required String phoneNumber}) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: _onVerificationFailed,
      codeSent: _onCodeSent,
      codeAutoRetrievalTimeout: _onCodeTimeout,
    );
  }

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");
    print(" ${authCredential.verificationId}");
    User? user = FirebaseAuth.instance.currentUser;

    if (authCredential.smsCode != null) {
      try {
        UserCredential credential =
        await user!.linkWithCredential(authCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'provider-already-linked') {
          await _auth.signInWithCredential(authCredential);
        }
      }
      // setState(() {
      //   isLoading = false;
      // });
      //Navigator.pushNamed(context, '/transfer');
    }
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    print("verification failed ${exception.message}");
    if (exception.code == 'invalid-phone-number') {
      // showMessage("The phone number entered is invalid!");
      // PrimarySnackBar(context).displaySnackBar(
      //   message: "The phone number entered is invalid!",
      //   backgroundColor: AppColors.errorRed,
      // );
    }
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    // setState(() {
    //   isLoading = false;
    // });
    //ask();
    // this.verificationId = verificationId;
    // print(forceResendingToken);
   // print(sms);
     print(verificationId);
    // print("code sent");
    Future.delayed(Duration(seconds: 2),(){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTP_verify(
            otpRequest: OTPRequest(
                forceResendingToken: forceResendingToken,
                verifyId: verificationId,
                phoneNumber: number.text,
                //name: username.text,
                see: "register",
                onSuccessCallback: () {
                  Navigator.pushNamed(context, 'momo');
                }),),
        ),
      );
    });
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

}


class OTPRequest {
  String? verifyId, phoneNumber,see, name;
  int? forceResendingToken;
  void Function()? onSuccessCallback;

  OTPRequest({
    this.verifyId,
    this.name,
    this.see,
    this.phoneNumber,
    this.forceResendingToken,
    this.onSuccessCallback,
  });
}
class OTP_verify extends StatefulWidget {
  OTPRequest otpRequest;
  OTP_verify({
    super.key,
    required this.otpRequest,
  });


  @override
  State<OTP_verify> createState() => _OTP_verifyState();
}

class _OTP_verifyState extends State<OTP_verify> {
  var verification;
  final _auth = FirebaseAuth.instance;
  Telephony telephony = Telephony.instance;
  String _otpString = "";
  OtpFieldController otpbox = OtpFieldController();
  String? verificationId;
  bool _wrongOtp = false;
  bool isLoading = false;
  bool isresend = true;
  String? sms;
  bool resend=false;
  String? see;




  // var verify;

  // FocusNode? pin7_get;
  timer_check(){
    Future.delayed(Duration(seconds: 90), (){
      setState((){
        resend=true;
      }) ;
    });
  }

  @override
  void initState() {


    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        // print(message.address); //+977981******67, sender nubmer
        // print(message.body); //Your OTP code is 34567
        // print(message.date); //1659690242000, timestamp

        String sms = message.body.toString(); //get the message


        if(message.address == "Google" || message.address=="CloudOTP" ||
            message.address=="wasime" || message.address=="Wasime"){
          //verify SMS is sent for OTP with sender number
          String otpcode = sms.replaceAll(new RegExp(r'[^0-9]'),'');
          //prase code from the OTP sms
          // print("This is $otpcode");
          otpbox.set(otpcode.split(""));
          //split otp code to list of number
          //and populate to otb boxes
          setState(() {});}
        else{print("Normal message.");}
      },
      // onBackgroundMessage:(SmsMessage message) {
      //   String sms = message.body.toString();
      //   if(message.address == "Google" || message.address=="CloudOTP" ||
      //       message.address=="wasime" || message.address=="Wasime"){
      //     String otpcode = sms.replaceAll(new RegExp(r'[^0-9]'),'');
      //     otpbox.set(otpcode.split(""));
      //   }} ,
      listenInBackground: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void get_remove_focus(String value, FocusNode focus) {
    if (value.length == 1) {
      focus.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
   // SizeConfig().init(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: 750,
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(

           // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: SizeConfig.blockSizeVertical * 2.3125),
              SizedBox(height:50),
              Text(
                //Hey ${widget.otpRequest.name},
                  "We've sent a code to the number ${widget.otpRequest.phoneNumber}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                   // SizedBox(height: Dimens.defaultPaddingSmall),
                    SizedBox(
                      width:double.infinity,
                      // child: OtpInput(
                      //   controller: otpbox,
                      //   autoFocus: true,
                      //   length: 6,
                      //   fieldSize: SizeConfig.blockSizeHorizontal*15,
                      //   otpInput: _otpString,
                      //   onChanged: onKeyPressed,
                      //   wrongOtp: _wrongOtp,
                      //   onCompleted: (val) => _verifyOtpCode(),
                      // ),
                      child:OTPTextField(
                        length: 6,
                        onChanged: onKeyPressed,
                        keyboardType: TextInputType.number,
                        controller: otpbox,
                        otpFieldStyle: OtpFieldStyle(

                        ),
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 50,
                        style: TextStyle(
                            fontSize: 17
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        //fieldStyle: F,
                        onCompleted: (val) async{
                          print(val);
                          Future.delayed(Duration(seconds: 1),(){_verifyOtpCode();});

                        },
                      ),
                    ),
                   // SizedBox(height:SizeConfig.blockSizeVertical*0.5),
                    //timer(),
                  ],
                ),
              ),
              // SizedBox(height: SizeConfig.blockSizeVertical * 59.75),
              // SizedBox(width: double.infinity,height:60,
              //   child: DefaultButton(
              //     onPressed: () async {
              //
              //       _verifyOtpCode();
              //     },
              //     backgroundColor: Colors.amberAccent,
              //     borderColor:Colors.amberAccent,
              //     foregroundColor: Colors.black,
              //     name: 'Confirm',
              //   ),
              // ),
              // Row(
              //   children: [
              //     Visibility(
              //       visible: resend,
              //       child: const Text("Didn't receive OTP?",
              //           style: TextStyle(
              //             color: Colors.grey,
              //           )),
              //     ),
              //     TextButton(
              //         onPressed: () {
              //           setState(() {
              //             isLoading ;
              //             isresend=false;
              //           });
              //         //  phoneSignIn(widget.otpRequest.phoneNumber.toString());  //phoneSignIn(phoneNumber: userNumber.text);
              //         },
              //         child:  Visibility(
              //           visible:resend,
              //           child: Text("Resend",
              //               style: TextStyle(
              //                 fontSize: 15,)),
              //         ))
              //   ],
              // )
            ],
          ),
        ));
  }
  void onKeyPressed(String inputValue) {
    setState(() {
      print("This is "+inputValue);
      _otpString = inputValue;
    });
  }
  _verifyOtpCode() async {
    setState(() {
      isLoading = true;
      _wrongOtp = false;
    });
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.otpRequest.verifyId.toString() , smsCode: _otpString);

    try {
      var result = await _auth.signInWithCredential(credential);

      if (result.user != null) {
        widget.otpRequest.onSuccessCallback?.call();
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }

      if (e.code == "invalid-verification-code") {
        setState(() {
          _wrongOtp = true;
        });
      }

      // PrimarySnackBar(context).displaySnackBar(
      //   message: "Wrong OTP code provided",
      //   backgroundColor: AppColors.errorRed,
      // );
    }

    setState(() {
      isLoading = false;
    });
  }
}