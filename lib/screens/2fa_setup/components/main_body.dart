//TODO 1: QR code / manual TOTP code mechanic
//TODO 2: Save to global variable
//TODO 3: Create Card on Submit
//TODO 4: Make cards expandable
//TODO 5: See if you can make the progress indicator smooth

//Import the files needed for widgets
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp/otp.dart';
import 'package:base32/base32.dart';

import 'screens/qr_code_scanner.dart';

late int timer1;

//Create the widget Main Body Class
class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  MainBodyState createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {
  Timer _timer = Timer(const Duration(milliseconds: 0), () {});
  late int _start;

  void startTimer() {
    const oneSec = Duration(seconds: 1);

    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 1) {
          setState(() {
            _start = 30;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  int onlyonce = 0;

  @override
  Widget build(BuildContext context) {
    if (onlyonce == 0) {
      int timer = 30;
      timer1 = timer;
      _start = timer1;
      startTimer();
      onlyonce = 1;
    }

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () => Navigator.pushNamed(context, QRViewExample.routeName), icon: const Icon(Icons.qr_code_scanner)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(value: _start / timer1)),
              Text(_start.toString(), style: const TextStyle(fontSize: 20))
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5),
          ),
          const TOTP(),
        ]),
      ],
    ));
  }
}

class TOTP extends StatefulWidget {
  const TOTP({Key? key}) : super(key: key);

  @override
  _TOTPState createState() => _TOTPState();
}

class _TOTPState extends State<TOTP> {
  Timer _timer = Timer(const Duration(milliseconds: 0), () {});

  void startTimer() {
    final time = Duration(seconds: timer1);

    _timer = Timer.periodic(time, (Timer timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  int onlyonce = 0;

  String totpCode = 'HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ';
  String totpCode32 = 'JFSGRLY7K4Z3GABL2QRELPUCMFB4XW5H';
  Algorithm algorithm = Algorithm.SHA1;

  @override
  Widget build(BuildContext context) {
    if (onlyonce == 0) {
      startTimer();
      onlyonce = 1;
      //totpCode32 = base32.encodeString(totpCode);
    }
    print(totpCode);
    print(totpCode32);
    return Column(
      children: [
        Text(
            OTP.generateTOTPCodeString(
                totpCode32, DateTime.now().millisecondsSinceEpoch - 90000,
                algorithm: algorithm),
            style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold)),
        Text(
            OTP.generateTOTPCodeString(
                totpCode32, DateTime.now().millisecondsSinceEpoch - 60000,
                algorithm: algorithm),
            style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold)),
        Text(
            OTP.generateTOTPCodeString(
                totpCode32, DateTime.now().millisecondsSinceEpoch - 30000,
                algorithm: algorithm),
            style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold)),
        Text(
            OTP.generateTOTPCodeString(
                totpCode32, DateTime.now().millisecondsSinceEpoch,
                algorithm: algorithm),
            style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold)),
        Text(
            OTP.generateTOTPCodeString(
                totpCode32, DateTime.now().millisecondsSinceEpoch + 30000,
                algorithm: algorithm),
            style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold)),
        Text(
            OTP.generateTOTPCodeString(
                totpCode32, DateTime.now().millisecondsSinceEpoch + 60000,
                algorithm: algorithm),
            style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold)),
        Text(
            OTP.generateTOTPCodeString(
                totpCode32, DateTime.now().millisecondsSinceEpoch + 90000,
                algorithm: algorithm),
            style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
