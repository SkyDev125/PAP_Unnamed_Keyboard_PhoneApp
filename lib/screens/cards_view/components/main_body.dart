//Import the files needed for widgets
import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:first_app/cards_store.dart';
import 'package:flutter/material.dart';
import 'package:first_app/components/variables.dart';
import 'package:hive/hive.dart';
import 'package:otp/otp.dart';

late String code;
late String temp;
late String totpSecret;
late String stringAlgorithm;
late Algorithm totpAlgorithm;
late int totpDigits;
late int totpPeriod;
late int _start;

//Create the widget Main Body Class
class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  MainBodyState createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {
  double textSize = 25;

  bool onlyonce = false;

  @override
  Widget build(BuildContext context) {
    final cardsBox = Hive.box('cards_data');
    CardInfo card = cardsBox.getAt(cardOnEdit);

    if (onlyonce == false) {
      String totpUrl = card.passwordTOTPUrl;

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

      _start = totpPeriod;
      onlyonce = true;
    }

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 35,
          bottom: MediaQuery.of(context).padding.bottom + 30,
          left: MediaQuery.of(context).padding.left + 10,
          right: MediaQuery.of(context).padding.right + 10,
        ),
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Visibility(
              visible: card.passwordTOTPUrl == "" ? false : true,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const TimerAnimation(),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                const TOTP(),
                IconButton(
                    onPressed: () {
                      FlutterClipboard.copy(code).then((result) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(clipboardSnackbarPassword(context));
                      });
                    },
                    icon: const Icon(Icons.copy)),
              ]),
            ),
            Text(
              "Website",
              style: TextStyle(
                  fontSize: textSize * 1.25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(card.passwordFormURL,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: textSize,
                            color: Theme.of(context).colorScheme.secondary)),
                  ),
                  IconButton(
                      onPressed: () {
                        FlutterClipboard.copy(card.passwordFormURL)
                            .then((result) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(clipboardSnackbarUrl(context));
                        });
                      },
                      icon: const Icon(Icons.copy)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(2),
            ),
            Text("Username",
                style: TextStyle(
                    fontSize: textSize * 1.25, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(card.passwordFormUsername,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: textSize,
                            color: Theme.of(context).colorScheme.secondary)),
                  ),
                  IconButton(
                      onPressed: () {
                        FlutterClipboard.copy(card.passwordFormUsername)
                            .then((result) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(clipboardSnackbarUsername(context));
                        });
                      },
                      icon: const Icon(Icons.copy)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(2),
            ),
            Text("Password",
                style: TextStyle(
                    fontSize: textSize * 1.25, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(card.passwordFormPassword,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: textSize,
                            color: Theme.of(context).colorScheme.secondary)),
                  ),
                  IconButton(
                      onPressed: () {
                        FlutterClipboard.copy(card.passwordFormPassword)
                            .then((result) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(clipboardSnackbarPassword(context));
                        });
                      },
                      icon: const Icon(Icons.copy)),
                ],
              ),
            ),
          ]),
        ));
  }

  SnackBar clipboardSnackbarPassword(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return SnackBar(
      duration: const Duration(seconds: 2),
      content: const Text("Password Copied to your ClipBoard",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  SnackBar clipboardSnackbarUsername(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return SnackBar(
      duration: const Duration(seconds: 2),
      content: const Text("Username Copied to your ClipBoard",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  SnackBar clipboardSnackbarUrl(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return SnackBar(
      duration: const Duration(seconds: 2),
      content: const Text("Website Copied to your ClipBoard",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}

class TimerAnimation extends StatefulWidget {
  const TimerAnimation({Key? key}) : super(key: key);

  @override
  _TimerAnimationState createState() => _TimerAnimationState();
}

class _TimerAnimationState extends State<TimerAnimation> {
  late Timer _timer;

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

  bool onlyonce = false;
  late UniqueKey animationKey;

  @override
  Widget build(BuildContext context) {
    if (onlyonce == false) {
      startTimer();
      onlyonce = true;
      animationKey = UniqueKey();
    }

    if (_start == 30) {
      animationKey = UniqueKey();
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            width: 40,
            height: 40,
            child: TweenAnimationBuilder<double>(
              key: animationKey,
              tween: Tween<double>(begin: 1, end: 0.0),
              duration: Duration(seconds: totpPeriod),
              onEnd: () => setState(() {
                animationKey = UniqueKey();
              }),
              builder: (context, value, _) =>
                  CircularProgressIndicator(value: value),
            )),
        Text(_start.toString(), style: const TextStyle(fontSize: 20))
      ],
    );
  }
}

class TOTP extends StatefulWidget {
  const TOTP({Key? key}) : super(key: key);

  @override
  _TOTPState createState() => _TOTPState();
}

class _TOTPState extends State<TOTP> {
  late Timer _timer;

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

  bool onlyonce = false;

  @override
  Widget build(BuildContext context) {
    if (onlyonce == false) {
      startTimer();
      onlyonce = true;
    }

    code = OTP.generateTOTPCodeString(
        totpSecret, DateTime.now().millisecondsSinceEpoch,
        length: totpDigits,
        interval: totpPeriod,
        algorithm: totpAlgorithm,
        isGoogle: true);

    return Column(children: [
      Text(
          OTP.generateTOTPCodeString(
              totpSecret, DateTime.now().millisecondsSinceEpoch,
              length: totpDigits,
              interval: totpPeriod,
              algorithm: totpAlgorithm,
              isGoogle: true),
          style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold)),
    ]);
  }
}
