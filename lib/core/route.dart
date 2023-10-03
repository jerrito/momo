import 'package:flutter/material.dart';
import 'package:momo/home/splash.dart';

import '../home/login_signup.dart';
import '../home/otp.dart';
import '../main.dart';
import '../pages/airtime_detail.dart';
import '../pages/just4u.dart';
import '../pages/momoPage.dart';
import '../pages/more.dart';
import '../pages/receipient_network.dart';
import '../widgets/bundleChoice.dart';
import '../widgets/buy.dart';
import '../widgets/credit.dart';
import '../widgets/loading.dart';
import '../widgets/recipient.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){

  switch(settings.name){
    case Splashscreen.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const Splashscreen());

    case MomoHomePage.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const MomoHomePage());
    case MomoPage.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const MomoPage());
    case MomoPage_2.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const MomoPage_2());
    case MoMo_3.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const MoMo_3());
    case MoMo_4.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const MoMo_4());
    case BuyCreditPage.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const BuyCreditPage());
    case Just4uPage.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const Just4uPage());
    case MorePage.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const MorePage());
    case BundleChoicePage.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const BundleChoicePage());
    case Recipient.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const Recipient());
    case RecipientNetwork.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const RecipientNetwork());
    case Number.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const Number());
    case LoginPage.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const LoginPage());
    case SignUpPage.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const SignUpPage());
    case Loading.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const Loading());
    case BuyChoiceSelf.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const BuyChoiceSelf(number: '',));
    case AirtimeDetails.routeName :
      return MaterialPageRoute(builder: (ctx)=>
      const AirtimeDetails());





    default:
      return MaterialPageRoute(builder: (ctx)=>
      const Scaffold(
        body: Center(child:
        Text("Page Not Found")),
      ));


  };


}