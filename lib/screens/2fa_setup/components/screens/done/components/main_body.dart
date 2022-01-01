//TODO 1: Make this the setup page for the totp codes (get the icon of the website and the url)
//TODO 2: Save info to global variable
//TODO 3: Create Card on Submit
//TODO 4: Make cards expandable
//TODO 5: See if you can make the progress indicator smooth

//Import the files needed for widgets
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:otp/otp.dart';
import '../../../../../../components/variables.dart';

late String temp;
late String totpSecret;
late String stringAlgorithm;
late Algorithm totpAlgorithm;
late int totpDigits;
late int totpPeriod;

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
            _start = totpPeriod;
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
      String totpUrl = data.code.toString();

      //totpSecret
      try {
        temp = totpUrl.substring(totpUrl.indexOf('secret='), totpUrl.length);
        totpSecret = temp.substring(7, temp.indexOf('&'));
      } catch (err) {
        try {
          temp = totpUrl.substring(totpUrl.indexOf('secret='), totpUrl.length);
          totpSecret = temp.substring(7, temp.length);
        } catch (err) {
          totpSecret = "";
        }
      }

      //totpAlgorithm
      try {
        temp = totpUrl.substring(totpUrl.indexOf('algorithm='), totpUrl.length);
        stringAlgorithm = temp.substring(10, temp.indexOf('&'));
      } catch (err) {
        try {
          temp =
              totpUrl.substring(totpUrl.indexOf('algorithm='), totpUrl.length);
          stringAlgorithm = temp.substring(10, temp.length);
        } catch (err) {
          stringAlgorithm = "";
        }
      }

      if (stringAlgorithm == "SHA1") {
        //SHA1
        totpAlgorithm = Algorithm.SHA1;
      } else if (stringAlgorithm == "SHA256") {
        //SHA256
        totpAlgorithm = Algorithm.SHA256;
      } else if (stringAlgorithm == "SHA512") {
        //SHA512
        totpAlgorithm = Algorithm.SHA512;
      } else {
        //Default
        totpAlgorithm = Algorithm.SHA1;
      }

      //totpDigits
      try {
        temp = totpUrl.substring(totpUrl.indexOf('digits='), totpUrl.length);
        totpDigits = int.parse(temp.substring(7, temp.indexOf('&')));
      } catch (err) {
        try {
          temp = totpUrl.substring(totpUrl.indexOf('digits='), totpUrl.length);
          totpDigits = int.parse(temp.substring(7, temp.length));
        } catch (err) {
          totpDigits = 6;
        }
      }

      //totpPeriod
      try {
        temp = totpUrl.substring(totpUrl.indexOf('period='), totpUrl.length);
        totpPeriod = int.parse(temp.substring(7, temp.indexOf('&')));
      } catch (err) {
        try {
          temp = totpUrl.substring(totpUrl.indexOf('period='), totpUrl.length);
          totpPeriod = int.parse(temp.substring(7, temp.length));
        } catch (err) {
          totpPeriod = 30;
        }
      }

      log(totpUrl);
      log(totpSecret);
      log(totpAlgorithm.toString());
      log(totpDigits.toString());
      log(totpPeriod.toString());

      _start = totpPeriod;
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
                  child: CircularProgressIndicator(value: _start / totpPeriod)),
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
    final time = Duration(seconds: totpPeriod);

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
    return Column(children: [
      Text(
          OTP.generateTOTPCodeString(
              totpSecret, DateTime.now().millisecondsSinceEpoch,
              length: totpDigits,
              interval: totpPeriod,
              algorithm: totpAlgorithm),
          style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold)),
    ]);
  }
}
