import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen_provider.dart';

class BridgeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenProvider screenProvider = Provider.of<ScreenProvider>(context, listen: false);

    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Text(
              '\nClass Bridge extends AndroidApp {',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    '\nInfo = Google J-term Final Project\nTechStack = [Java, Google FireBase Authentication && Google FireStore Realtime Database]\n\nSummary = Was there a time when you asked your friends to get you bubble tea',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  // TODO(Sohee): automatic resize
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      'on their way back to campus? BRIDGE provides the platform for you \nto connect with people on and off campus!\n\n',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ])),
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                    width: 250, height: 450, child: Image.asset('images/bridge/bridge_main.png', fit: BoxFit.contain)),
                Text(
                  '// main page where you can order pickups from your friends',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  '// you can request orders and \n// confirm your order status at MyRequest page',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Container(
                    width: 250,
                    height: 450,
                    child: Image.asset('images/bridge/bridge_request_order.png', fit: BoxFit.contain)),
                Container(
                    width: 250,
                    height: 450,
                    child: Image.asset('images/bridge/bridge_my_request.png', fit: BoxFit.contain)),
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                    width: 250,
                    height: 450,
                    child: Image.asset('images/bridge/bridge_go_trip.png', fit: BoxFit.contain)),
                Container(
                    width: 250,
                    height: 450,
                    child: Image.asset('images/bridge/bridge_confirm_request.png', fit: BoxFit.contain)),
                Text(
                  '// If you are heading off campus \n// upload your destination and get pick-up requests.\n// you can manage your request at ConfirmReuest page',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
