//Import the files needed for widgets
import 'dart:async';
import 'package:first_app/bloc/passwords_bloc.dart';
import 'package:first_app/cards_store.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otp/otp.dart';
import 'package:first_app/components/variables.dart';
import 'package:first_app/screens/password_setup/components/custum_input_box.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

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
  bool onlyonce = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (onlyonce == false) {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            TimerAnimation(),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            TOTP(),
          ]),
          const Padding(padding: EdgeInsets.all(10)),
          FormWidget(formKey: _formKey),
        ],
      ),
    );
  }
}

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const MyCustomInputBox(
            label: "Website",
            inputHint: "www.example.com",
            identifier: 0,
          ),
          const Padding(
            padding: EdgeInsets.all(2),
          ),
          const MyCustomInputBox(
            label: "Username",
            inputHint: "Example312",
            identifier: 1,
          ),
          const Padding(
            padding: EdgeInsets.all(2),
          ),
          const MyCustomInputBox(
            label: "Password",
            inputHint: "Ex@mple",
            identifier: 2,
          ),
          const Padding(
            padding: EdgeInsets.all(2),
          ),
          ElevatedButton(
            onPressed: () async {
              await requestGET(url);
              if (_formKey.currentState?.validate() ?? false) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      duration: const Duration(days: 1),
                      content: const Text(
                        'Processing Data',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                );

                _formKey.currentState!.save();

                final newCardInfo = CardInfo(formURL,
                    formUsername, formPassword, data.code.toString(), "", "");
                Hive.box('cards_data').add(newCardInfo);

                snackbarOn = 1;
                Navigator.of(context).popUntil(ModalRoute.withName("/"));

                context
                    .read<PasswordsBloc>()
                    .add(const PasswordsEvent.cardAdd());
              }
            },
            child: const Text('Submit', style: TextStyle(fontSize: 20)),
          )
        ]));
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
