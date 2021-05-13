import 'package:eros/Components/RouteTransition/SlideLeftRouteTransition.dart';
import 'package:eros/Components/RouteTransition/SlideRightRouteTransition.dart';
import 'package:eros/Components/RouteTransition/SlideUpRouteTransition.dart';
import 'package:eros/Themes/DarkTheme.dart';
import 'package:eros/Views/CartView.dart';
import 'package:eros/Views/GameView.dart';
import 'package:eros/Views/LoginView.dart';
import 'package:eros/Views/SettingsView.dart';
import 'package:eros/Views/ShopView.dart';
import 'package:eros/Views/SmokeView.dart';
import 'package:eros/Views/VibratorView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:eros/Views/UserView.dart";
import "package:eros/Views/PaymentView.dart";
import "package:eros/Views/InstructionView.dart";
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:eros/Views/SmokeView.dart';
import 'package:eros/Views/ToyView.dart';
import 'package:eros/Views/TruthView.dart';
import 'package:eros/Views/DiceView.dart';

import 'Components/RouteTransition/FadeRouteTransition.dart';
import 'Constants/Routes.dart';
import 'Views/HomeView.dart';

void main() => runApp(EROSApp());

class EROSApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return GestureDetector(
      onTap: (){
        FocusNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus){
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        initialRoute: ROUTE_LOGIN,
        title: 'Direct Message and Transaction',
        theme: darkTheme,
        navigatorKey: navigatorKey,
        onGenerateRoute: (RouteSettings settings){
          Map<String,dynamic> args = settings.arguments != null ? Map<String,dynamic>.of(settings.arguments) : {};
          switch(settings.name){
            case ROUTE_HOME: return FadeRouteTransition<dynamic>(widget: HomeView());
            case ROUTE_LOGIN: return FadeRouteTransition<dynamic>(widget: LoginView());
            case ROUTE_SHOP: return SlideRightRouteTransition<dynamic>(widget: ShopView());
            case ROUTE_SETTINGS: return SlideLeftRouteTransition<dynamic>(widget: SettingsView());
            case ROUTE_GAME: return FadeRouteTransition<dynamic>(widget: GameView());
            case ROUTE_CART: return FadeRouteTransition<dynamic>(widget: CartView());
            case ROUTE_USER: return FadeRouteTransition<dynamic>(widget: UserView());
            case ROUTE_PAYMENT: return FadeRouteTransition<dynamic>(widget: PaymentView());
            case ROUTE_INSTRUCTION: return FadeRouteTransition<dynamic>(widget: InstructionView());
            case ROUTE_VIBRATOR: return FadeRouteTransition<dynamic>(widget: VibratorView());
            case ROUTE_SMOKE: return FadeRouteTransition<dynamic>(widget: SmokeView());
            case ROUTE_TOY: return FadeRouteTransition<dynamic>(widget: ToyView());
            case ROUTE_TRUTH: return FadeRouteTransition<dynamic>(widget: TruthView());
            case ROUTE_DICE: return FadeRouteTransition<dynamic>(widget: DiceView());
          }
          return FadeRouteTransition(widget: HomeView());
        },
      ),
    );
  }
}