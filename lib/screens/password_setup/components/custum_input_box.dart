import 'package:first_app/components/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

String url = "";

bool websiteOnline = false;

Future<void> requestGET(value) async {
  try {
    final response = await http.get(Uri.parse("http://" + value));
    switch (response.statusCode) {
      case 200:
      case 201:
        websiteOnline = true;
    }
  } catch (err) {
    websiteOnline = false;
  }
}

// ignore: must_be_immutable
class MyCustomInputBox extends StatefulWidget {
  String label;
  String inputHint;
  int identifier;

  MyCustomInputBox({
    Key? key,
    required this.label,
    required this.inputHint,
    required this.identifier,
  }) : super(key: key);
  @override
  _MyCustomInputBoxState createState() => _MyCustomInputBoxState();
}

class _MyCustomInputBoxState extends State<MyCustomInputBox> {
  bool isSubmitted = false;

  final _formFieldKey = GlobalKey<FormFieldState>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _debounce.cancel();
    super.dispose();
  }

  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

  _onSearchChanged(String value) {
    if (widget.identifier == 0) {
      url = value;
    }

    if (_debounce.isActive) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (widget.identifier == 0) {
        await requestGET(value);
      }

      if (_formFieldKey.currentState!.validate()) {
        setState(() {
          isSubmitted = true;
        });
      } else {
        setState(() {
          isSubmitted = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, bottom: 8),
            child: Text(
              widget.label,
              style: const TextStyle(
                fontFamily: 'Product Sans',
                fontSize: 15,
              ),
            ),
          ),
        ),
        //
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
          child: TextFormField(
            controller: _textEditingController,
            key: _formFieldKey,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              } else {
                if (widget.identifier == 0) {
                  if (websiteOnline) {
                    return null;
                  }
                  return 'Website is Unreacheable';
                }
              }
            },
            onSaved: (value) {
              switch (widget.identifier) {
                case 0:
                  passwordsFormURL.add(value);
                  break;
                case 1:
                  passwordsFormUsername.add(value);
                  break;
                case 2:
                  passwordsFormPassword.add(value);
                  break;
              }
            },
            cursorColor: Theme.of(context).colorScheme.secondary,
            obscureText: widget.label == 'Password' ? true : false,
            // this can be changed based on usage -
            // such as - onChanged or onFieldSubmitted
            onChanged: (value) => _onSearchChanged(value),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
              ),
              hintText: widget.inputHint,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 27, horizontal: 25),
              focusColor: Theme.of(context).colorScheme.secondary,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              suffixIcon: isSubmitted == true
                  //Turns CheckBox on or off depending on the condition above
                  ? Visibility(
                      visible: true,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.check,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    )
                  : const Visibility(
                      visible: false,
                      child: Icon(Icons.check),
                    ),
            ),
            textInputAction: TextInputAction.next,
          ),
        ),
        //
      ],
    );
  }
}
