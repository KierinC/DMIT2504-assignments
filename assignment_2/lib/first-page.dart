//Do not change the structure of this files code.
//Just add or replace code at the TODO's.

// ignore_for_file: use_key_in_widget_constructors, file_names, todo, unused_field, unused_import, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:assignment_2/themes/theme.dart';

final formKey = GlobalKey<FormState>();
String firstName = '';
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool _enabled = false;
  int _timesClicked = 0;
  String _msg1 = 'Click Me';
  String _msg2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the label and switch here
              //as children of the row.
              const Text('Enable Buttons'),
              Switch(
                value: _enabled,
                onChanged: (bool onChangedValue) {
                  _enabled = onChangedValue;
                  setState(() {
                    if (_enabled) {
                      _timesClicked = 0;
                      _msg1 = 'Click Me';
                    }
                  });
                }
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the two buttons here
              //as children of the row.
              Visibility(
                visible: _enabled,
                child: ElevatedButton(
                  onPressed: () {
                        setState(() {
                          _timesClicked++;
                          _msg1 = 'Clicked $_timesClicked';
                        });
                      },
                  child: Text(_msg1)
                ),
              ),
              Visibility(
                visible: _enabled,
                child: ElevatedButton(
                  onPressed: () {
                        setState(() {
                          
                        });
                  },
                  child: const Text('Reset')
                )
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: Build the text form field here as the first
                  //child of the column.
                  TextFormField(
                    controller: textEditingController,
                    onChanged: (value) {
                      print(value);
                    },
                    onFieldSubmitted: (text) {
                      print('Submitted Text = $text');
                      if (formKey.currentState!.validate()) {
                        print('the input is now valid');
                      }
                    },
                    validator: (input) {
                      if (input!.length > 1 && input.length < 10) {
                        return input;
                      } else {
                        return '';
                      }
                    },
                    onSaved: (input) {
                      print('onSaved = $input');
                      firstName = input.toString();
                    },
                    maxLength: 20,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.emoji_emotions),
                      labelText: 'First Name',
                      helperText: 'min 1, max 10',
                      suffixIcon: Icon(
                        Icons.check_circle,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SnackbarButton(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SnackbarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: Build the submit button and snackbar here by
    //replacing this Text widget with what is necessary.
    return Text('');
  }
}
