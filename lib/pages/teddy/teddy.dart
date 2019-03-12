import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/pages/teddy/signin_button.dart';
import 'package:flutter_app/pages/teddy/teddy_controller.dart';
import 'package:flutter_app/pages/teddy/tracking_text_input.dart';

class Teddy extends StatefulWidget {
  const Teddy({Key key}) : super(key: key);

  @override
  _TeddyState createState() => _TeddyState();
}

class _TeddyState extends State<Teddy> {
  TeddyController _teddyController;

  @override
  void initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(48, 48, 0, 0),
          child: Text(
            'Meet Teddy',
            style: Theme.of(context).primaryTextTheme.title,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 300,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: FlareActor(
                      'assets/Teddy.flr',
                      shouldClip: false,
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.contain,
                      controller: _teddyController,
                    )),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 600),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 24),
                        child: _buildForm(),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TrackingTextInput(
            label: 'Email',
            hint: "What's your email address?",
            onCaretMoved: _teddyController.lookAt,
            textVisibilityChanged: _teddyController.coverEyes,
          ),
          TrackingTextInput(
            label: 'Password',
            hint: "Try 'bears'...",
            isObscured: true,
            onCaretMoved: _teddyController.lookAt,
            onTextChanged: (value) => _teddyController.password = value,
            textVisibilityChanged: (visible) {
              _teddyController.coverEyes(visible);
              if (!visible) {
                _teddyController.lookAt(null);
              }
            },
          ),
          SigninButton(
            child: Text(
              'Sign In',
              style: Theme.of(context).primaryTextTheme.button,
            ),
            onPressed: _teddyController.submitPassword,
          )
        ],
      ),
    );
  }
}
