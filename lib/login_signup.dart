import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:flutter/material.dart';
import 'package:momo/components/button_input.dart';
import 'package:momo/firebase.dart';
import 'package:momo/components/loading.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:momo/otp.dart';
import 'package:momo/userProvider.dart';
import 'package:momo/user.dart' as User_main;


class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  var firebaseService = FirebaseServices();
  UserProvider? userProvider;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  bool loadingornot=false;
 final TextEditingController number=TextEditingController();

  @override
  void initState() {
    userProvider = context.read<UserProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color:Colors.amber[400],
            padding: EdgeInsets.all(10),
            child:Visibility(
              visible:!loadingornot,
              replacement:  Center(
                child: AlertDialog(
                  backgroundColor: Colors.black,
                  content: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:const [
                        CircularProgressIndicator(color:Color.fromRGBO(20, 100, 150, 1)),
                        Text("Processing",style:TextStyle(color:Colors.white)),
                      ]),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(height:30),
                        Center(
                            child: Text("Jerrito's Momo", style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold, color: Colors.black),)),
                        SizedBox(height:25),
                        Center(
                            child:Image.asset("./assets/images/images.png",height: 200,width: 300,)
                        ), SizedBox(height:20),
                        Center(child: Text("Let's get things going by logging", style: TextStyle(fontSize: 17, color: Colors.black),)),
                        SizedBox(height:20),
                          DefaultTextInput(
                          controller: number,
                           hintText: '0244444444',
                          keyboardType: TextInputType.number,
                          // suffixIcon:Icon(Icons.person) ,
                        ),
                        SizedBox(height: 20,),

                      ],
                    ),
                  ),
                  SizedBox(
                    height:60,width:double.infinity,
                    child: DefaultButton(name: "Login",
                      backgroundColor:Color.fromRGBO(20, 100, 150, 1),
                      foregroundColor: Colors.white,
                      onPressed: ()async{
                        setState(() {
                          loadingornot=true;
                        });
                       await  loginWithPhoneNumber();
                      }, borderColor:Color.fromRGBO(20, 100, 150, 1),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(child: Row(
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(child:const Text("Signup",style:TextStyle(color:Color.fromRGBO(20, 100, 150, 1))),
                          onPressed: (){Navigator.pushNamed(context, 'signup');},),
                      ],
                    )),
                  ),
                ],
              ),
            )



        ));
  }
  Future<void> loginWithPhoneNumber() async {
    setState(() {
      loadingornot = true;
    });
    String completeNumber = "+233${number.text.substring(1)}";


    var result= await userProvider?.getUser(phoneNumber: completeNumber);
  //  var result = await userProvider?.getUser(phoneNumber: completeNumber);

     if (result?.status == QueryStatus.Successful) {
      var user = result?.data;
     print("this is ${user?.number}");
      if (user?.number == completeNumber) {
        await phoneSignIn(phoneNumber: completeNumber);
        return; }
      else{ ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(duration: Duration(seconds: 5),
            content: Text("No account found",style:TextStyle(color:Colors.white)),
            backgroundColor: Color.fromRGBO(20, 100, 150, 1),));
      }

        setState(() {
          loadingornot = false;
        });


      // setState(() {
      //   isLoading = false;
      // });

      // PrimarySnackBar(context).displaySnackBar(
      //   message: AppStrings.noAccountFoundErrorText,
      //   backgroundColor: AppColors.errorRed,
      // );

      return;
    }
    else if(result?.status==QueryStatus.Failed ){
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(duration: Duration(seconds: 5),
             content: Text("No account found",style:TextStyle(color:Colors.white)),
             backgroundColor: Color.fromRGBO(20, 100, 150, 1),));
      print("user?. none");
      // setState(() {
      //   isLoading = false;
      // });

      // PrimarySnackBar(context).displaySnackBar(
      //   message: (result?.error ?? "Error logging in").toString(),
      //   backgroundColor: AppColors.errorRed,
      // );
    }
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
      setState((){loadingornot=false;});
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(duration: Duration(seconds: 5),
            content: Text("The phone number entered is invalid!",style:TextStyle(color:Colors.white)),
            backgroundColor: Color.fromRGBO(20, 100, 150, 1),));
    }
    setState((){loadingornot=false;});
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 5),
          content: Text("Coudn't verify user, try again",style:TextStyle(color:Colors.white)),
          backgroundColor: Color.fromRGBO(20, 100, 150, 1),));
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
    setState((){loadingornot=false;});
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
                onSuccessCallback: () async{
                  var result_2 = await userProvider?.getUser(phoneNumber: "+233${number.text.substring(1)}");
                  if (result_2?.status == QueryStatus.Successful) {

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(duration: Duration(seconds: 5),
                          content: Text("Successfully logged in ${result_2?.data?.firstname}",style:TextStyle(color:Colors.white)),
                          backgroundColor: Color.fromRGBO(20, 100, 150, 1),));
                    Navigator.pushNamed(context, 'momoHomePage');
                  }
                  Future.delayed(Duration(seconds:120),(){
                    Navigator.pushNamed(context, 'login');
                  });

                }),),
        ),
      );
    });
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

}



class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final  message=GlobalKey<ScaffoldMessengerState>();
  UserProvider? userProvider;
  bool loadingornot=false;
  TextEditingController name=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController pin1=TextEditingController();
  TextEditingController pin2=TextEditingController();
  int airtime=Random().nextInt(100);
  int data=Random().nextInt(5000);
  int sms=Random().nextInt(100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:message,
        body:
        Container(
          color:Colors.amber[400],width:double.infinity,
            padding: EdgeInsets.all(10),
            child:Visibility(
              visible: !loadingornot,
              replacement: Center(
                child: AlertDialog(
                  backgroundColor: Colors.black,
                  content: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:const [
                        CircularProgressIndicator(color:Color.fromRGBO(20, 100, 150, 1)),
                        Text("Processing",style:TextStyle(color:Colors.white)),
                      ]),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(height:30),
                        Center(
                            child: Text("Jerrito's MoMo", style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold, color: Colors.black),)),
                        Center(
                            child:Image.asset("./assets/images/images.png",height: 200,width: 300,)
                        ),
                          Center(child: Text("Let's get things going by signing up", style: TextStyle(fontSize: 17, color: Colors.black),)),
                        SizedBox(height:15),
                        DefaultTextInput(
                          hintText: "Firstname",
                          controller: name,
                          // suffixIcon:Icon(Icons.person) ,
                        ),
                        SizedBox(height:15),
                        DefaultTextInput(
                          hintText: "0244444444",
                          controller: number,
                          keyboardType: TextInputType.number,
                          // suffixIcon:Icon(Icons.person) ,
                        ),
                        SizedBox(height:15),
                         DefaultTextInput(
                          hintText: "Pincode",
                          controller: pin1,
                          keyboardType: TextInputType.number,
                          // suffixIcon:Icon(Icons.person) ,
                        ),
                        SizedBox(height: 20,),

                        SizedBox(height:15),
                        // Visibility(
                        //   visible:!loadingornot,
                        //   child: AlertDialog(
                        //     backgroundColor: Colors.black,
                        //     content: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //      children:const [ CircularProgressIndicator(color:Colors.white),
                        //        Text("Processing",style:TextStyle(color:Colors.white)),
                        //       ]
                        //     ),
                        //   ),
                        //
                        // ),
                         ],   ),
                        ),
                        SizedBox(
                          height:60,width:double.infinity,
                          child: DefaultButton(name: "Signup",
                            backgroundColor:Color.fromRGBO(20, 100, 150, 1) ,
                            foregroundColor:Colors.white,
                            borderColor:Color.fromRGBO(20, 100, 150, 1) ,
                            onPressed:loadingornot? null
                                :()async{
                          // Navigator.push(context, MaterialPageRoute(builder:
                          //     (context)=>Loading(loadingornot: true,)));
                              setState(() {
                                loadingornot=true;
                              });
                              print(loadingornot);
                            await momoRegister();

                            },
                            ),),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(child: Row(
                            children: [
                              const Text("Already have an account?"),
                              TextButton(child:const Text("Login"),onPressed: (){
                     Navigator.pushNamed(context,"login");
                              },),
                            ],
                          )),
                        ),
                  SizedBox(height:10),
                      ],


              ),
            )
        )
    );
  }
  AlertDialog  alert(){
    return  AlertDialog(
      backgroundColor: Colors.black,
      content: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:const [ CircularProgressIndicator(color:Colors.white),
            Text("Processing",style:TextStyle(color:Colors.white)),
          ]
      ),
    );
  }
  Future<void> phoneSignIn({required String phoneNumber}) async {
    await _auth.verifyPhoneNumber(
      timeout: const Duration(seconds:120),
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
                onSuccessCallback: () async {


                  var user = User_main.User(
                      number: "+233${number.text.substring(1)}",
                      firstname: name.text,
                      credit:airtime.toString(),
                      data:data.toString(),
                      sms:sms.toString(),
                      password:pin1.text
                      //transactionPin: sha256.convert(utf8.encode(pin_1.text)).toString(),
                      //registrationTime: DateFormat.yMMMMd().format(DateTime.now()).toString()
                  );
                  var result = await FirebaseServices().saveUser(user: user);

                  if (result?.status == QueryStatus.Successful) {
                    userProvider=context.read<UserProvider>();
                    print("Account success");
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(duration: Duration(seconds: 5),
                          content: Text("Successfully registered ${userProvider?.appUser?.firstname}",style:TextStyle(color:Colors.white)),
                          backgroundColor: Color.fromRGBO(20, 100, 150, 1),));
                    var result2= await userProvider?.getUser(phoneNumber: "+233${number.text.substring(1)}");
                    print(result2?.status);
                    if (result2?.status == QueryStatus.Successful) {
                      Navigator.pushNamed(context, 'momoHomePage');
                    }
                    // await uploadingData(name.text, number.text, airtime.toString(),
                    // data.toString(), sms.toString(), pin1.text);

                    //await Navigator.pushNamed(context, 'momoHomePage');
                  }}


        ),),
        ),
      );
    });
  }

  _onCodeTimeout(String timeout) {
    return null;
  }


  Future<void> momoRegister()async {
    print("sup");
    String completePhoneNumber = "+233${number.text.substring(1)}";

    var result_main = await FirebaseServices().getUser(
        phoneNumber: completePhoneNumber);


    print(result_main?.status);

    if (result_main?.status == QueryStatus.Successful) {
      var user_old = result_main?.data;
      if (user_old?.number == completePhoneNumber) {
        setState(() {
          loadingornot = false;
        });
        print("Account already exist");
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(duration: Duration(seconds: 5),
              content: Text("Account already exist",style:TextStyle(color:Colors.white)),
              backgroundColor: Color.fromRGBO(20, 100, 150, 1),));

        // PrimarySnackBar(context).displaySnackBar(
        //   message: AppStrings.accountExistErrorMessage,
        //   backgroundColor: AppColors.errorRed,
        // );

        return;
      }
      phoneSignIn(phoneNumber: "+233${number.text.substring(1)}");
    }
    setState(() {
      loadingornot = false;
    });
    print("Account error");
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 5),
          content: Text("Error registering account",style:TextStyle(color:Colors.white)),
          backgroundColor: Color.fromRGBO(20, 100, 150, 1),));
  }

  }
