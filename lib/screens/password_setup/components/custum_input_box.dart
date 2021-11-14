import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCustomInputBox extends StatefulWidget {
  String label;
  String inputHint;

  MyCustomInputBox({Key? key, required this.label, required this.inputHint})
      : super(key: key);
  @override
  _MyCustomInputBoxState createState() => _MyCustomInputBoxState();
}

class _MyCustomInputBoxState extends State<MyCustomInputBox> {
  bool isSubmitted = false;

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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },

            cursorColor: Theme.of(context).colorScheme.secondary,
            obscureText: widget.label == 'Password' ? true : false,
            // this can be changed based on usage -
            // such as - onChanged or onFieldSubmitted
            //TODO: Change to add regex
            onChanged: (value) {
              setState(() {
                isSubmitted = true;
              });
            },
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: widget.inputHint,
              hintStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
          ),
        ),
        //
      ],
    );
  }
}
