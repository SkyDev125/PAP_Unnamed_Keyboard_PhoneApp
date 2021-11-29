//TODO 1: QR code / manual TOTP code mechanic
//TODO 2: Save to global variable
//TODO 3: Create Card on Submit
//TODO 4: Make cards expandable
//TODO 5: See if you can make the progress indicator smooth

//Import the files needed for widgets
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp/otp.dart';

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

  @override
  Widget build(BuildContext context) {
    if (onlyonce == 0) {
      startTimer();
      onlyonce = 1;
    }
    return Text(
        OTP.generateTOTPCodeString('HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ',
            DateTime.now().millisecondsSinceEpoch, algorithm: Algorithm.SHA1),
        style: TextStyle(
            fontSize: 30,
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold));
  }
}
