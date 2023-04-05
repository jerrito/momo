﻿import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:momo/Screen.dart';
import 'package:momo/Size_of_screen.dart';
import 'package:momo/bundleChoice.dart';
import 'package:momo/buy.dart';
import 'package:momo/components/bottom_Bar.dart' as bottoms;
import 'package:momo/components/credit.dart';
import 'package:momo/components/drawer.dart';
import 'package:momo/components/loading.dart';
import 'package:momo/firebase_options.dart';
import 'package:momo/just4u.dart';
import 'package:momo/home/login_signup.dart';
import 'package:momo/momoPage.dart';
import 'package:momo/more.dart';
import 'package:momo/home/otp.dart';
import 'package:momo/recipient.dart';
import 'package:momo/home/splash.dart';
import 'package:momo/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
  );
}

var buttonIndex = 0;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MoMoApp(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      // theme: ThemeData(
      //   iconTheme:const IconThemeData(color:Colors.black),
      //   primaryIconTheme:const IconThemeData(color:Colors.black) ,
      //   appBarTheme: const AppBarTheme(centerTitle: true,),primaryColor: Colors.amber[400]),
      initialRoute: 'splash',
      routes: {
        'momoHomePage': (context) => const MomoHomePage(),
        "momo": (context) => const momoPage(),
        "momo_2": (context) => const MomoPage_2(),
        "momo_3": (context) => const MoMo_3(),
        "momo_4": (context) => const MoMo_4(),
        "credit": (context) => const BuyCreditPage(),
        "just4u": (context) => const Just4uPage(),
        "more": (context) => const MorePage(),
        "bundleChoice": (context) => const BundleChoicePage(),
        "recipient": (context) => const Recipient(),
        "splash": (context) => const Splashscreen(),
        "number": (context) => const Number(),
        "login": (context) => const Loginpage(),
        "signup": (context) => const SignUpPage(),
        "loading": (context) => const Loading(),
        "buyChoiceSelf": (context) => const BuyChoiceSelf(),
      },
    ),
  ));
}

class MoMoApp extends StatelessWidget {
  final Widget? child;

  const MoMoApp({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
              //color: AppColors.colorPrimary,
              );
        }

        return MultiProvider(
          providers: [
            ListenableProvider(
              create: (_) => UserProvider(preferences: snapshot.data),
            ),
          ],
          child: child,
        );
      },
    );
  }
}

class MomoHomePage extends StatefulWidget {
  const MomoHomePage({Key? key}) : super(key: key);

  @override
  State<MomoHomePage> createState() => _MomoHomePageState();
}

class _MomoHomePageState extends State<MomoHomePage> {
  final LocalAuthentication auth = LocalAuthentication();
  UserProvider? userProvider;
  late String id;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> authenticate() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Check MoMo Balance',
          options: const AuthenticationOptions(stickyAuth: true));
      if (didAuthenticate == true) {
        // print("cool");
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        // Add handling of no hardware here.
      } else if (e.code == auth_error.notEnrolled) {
        // ...
        // print("damn");
      } else {
        // ...
        // print("norm");
      }
    }
  }

  @override
  void initState() {
    userProvider = context.read<UserProvider>();

    //print(userProvider?.appUser?.firstname);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MomoScreen(
      keys: _scaffoldKey,
      title: Text("Home", style: TextStyle(color: Colors.black)),
      actions: [
        IconButton(
          icon: Icon(Icons.format_align_justify, color: Colors.black),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ],
      floatingAction: const bottoms.FloatingAction(),
      bottomNavigationBar: const BottomAppBar(
        child: bottoms.BottomAppBarMain(
          color_1: Colors.amberAccent,
        ),
      ),
      drawer: MoMoDrawer(
        onPressed: () {
          _scaffoldKey.currentState?.closeDrawer();
        },
      ),
      body: Container(
        color: Color.fromRGBO(230, 230, 230, 1),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Text("Yello ${userProvider?.appUser?.firstname}",
                    style:
                        TextStyle(fontSize: 20, fontStyle: FontStyle.italic))),
          ),
          SizedBox(height: 50),
          Credit(
            text: "Airtime",
            icon: Icons.phone_android,
            Texts: "GHc ${userProvider?.appUser?.credit}",
          ),
          Credit(
              text: "Data",
              icon: Icons.signal_cellular_alt_rounded,
              Texts: "${userProvider?.appUser?.data} MB"),
          Credit(
            text: "SMS",
            icon: Icons.messenger,
            Texts: '${userProvider?.appUser?.sms} SMS',
          ),
          Credit(
            text: "BroadBand",
            Texts: 'Get BroadBand',
            icon: Icons.router_outlined,
          ),
        ]),
      ),
    );
    //
    //  StreamBuilder<QuerySnapshot>(
    //      stream: FirebaseFirestore.instance.collection("momodatabase").snapshots(),
    //    builder: (context, snapshot) {
    //      return !snapshot.hasData
    //          ? const Center(child: CircularProgressIndicator())
    //       :  ListView.builder(
    //          itemCount: snapshot.data!.docs.length,
    //         itemBuilder: (context, index) {
    //    DocumentSnapshot data = snapshot.data!.docs[index++];
    //   return  MomoData(
    //   documentSnapshot: data,
    //   id: data.id,
    //   firstname: data["firstname"],
    //   number: data["number"],
    //   credit: data["credit"],
    //   data: data["data"],
    //   sms: data["sms"],
    //   password: data["password"],
    //
    //   );
    //    }
    //  );}));
    // }
  }
}
