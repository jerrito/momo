import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:momo/core/Size_of_screen.dart';
import 'package:momo/firebase_options.dart';
import 'package:momo/home/login_signup.dart';
import 'package:momo/home/otp.dart';
import 'package:momo/home/splash.dart';
import 'package:momo/models/userProvider.dart';
import 'package:momo/pages/Screen.dart';
import 'package:momo/pages/airtime_detail.dart';
import 'package:momo/pages/just4u.dart';
import 'package:momo/pages/momoPage.dart';
import 'package:momo/pages/more.dart';
import 'package:momo/pages/receipient_network.dart';
import 'package:momo/widgets/bottom_Bar.dart' as bottoms;
import 'package:momo/widgets/bundleChoice.dart';
import 'package:momo/widgets/buy.dart';
import 'package:momo/widgets/credit.dart';
import 'package:momo/widgets/drawer.dart';
import 'package:momo/widgets/loading.dart';
import 'package:momo/widgets/recipient.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/route.dart';

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
  );
}

var buttonIndex = 0;
bool floatButtonActive =false;
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
      //initialRoute: 'splash',
      home:const Splashscreen(),
      onGenerateRoute:(settings)=> onGenerateRoute(settings),
      // routes: {
      //   'momoHomePage': (context) => const MomoHomePage(),
      //   "momo": (context) => const MomoPage(),
      //   "momo_2": (context) => const MomoPage_2(),
      //   "momo_3": (context) => const MoMo_3(),
      //   "momo_4": (context) => const MoMo_4(),
      //   "credit": (context) => const BuyCreditPage(),
      //   "just4u": (context) => const Just4uPage(),
      //   "more": (context) => const MorePage(),
      //   "bundleChoice": (context) => const BundleChoicePage(),
      //   "recipient": (context) => const Recipient(),
      //   "recipientNetwork": (context) => const RecipientNetwork(),
      //   "splash": (context) => const Splashscreen(),
      //   "number": (context) => const Number(),
      //   "login": (context) => const LoginPage(),
      //   "signup": (context) => const SignUpPage(),
      //   "loading": (context) => const Loading(),
      //   "buyChoiceSelf": (context) => const BuyChoiceSelf(number: '',),
      //   "airtimeDetails": (context) => const AirtimeDetails(),
      // },
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
  static const String routeName="/momoHomePage";
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
    super.initState();
    userProvider = context.read<UserProvider>();

    //print(userProvider?.appUser?.firstname);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MomoScreen(
      keys: _scaffoldKey,
      title: const Text("Home", style: TextStyle(color: Colors.black)),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
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
        color: const Color.fromRGBO(230, 230, 230, 1),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text("Yello ${userProvider?.appUser?.firstname}",
                    style: const TextStyle(
                        fontSize: 20, fontStyle: FontStyle.italic))),
          ),
          const SizedBox(height: 50),
          Credit(
            onTap: (){
              print("Hee");
              Navigator.pushNamed(context,"airtimeDetails");
            },
            text: "Airtime",
            icon: Icons.phone_android,
            texts: "GHc ${userProvider?.appUser?.credit}",
          ),
          Credit(
              onTap: (){

              },
              text: "Data",
              icon: Icons.signal_cellular_alt_rounded,
              texts: "${userProvider?.appUser?.data} MB"),
          Credit(
            text: "SMS",
            icon: Icons.messenger,
            texts: '${userProvider?.appUser?.sms} SMS',
          ),
          const Credit(
            text: "BroadBand",
            texts: 'Get BroadBand',
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
