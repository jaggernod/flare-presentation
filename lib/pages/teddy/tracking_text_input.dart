import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/pages/teddy/input_helper.dart';

typedef void CaretMoved(Offset globalCaretPosition);
typedef void TextChanged(String text);
typedef void TextVisibilityChanged(bool visible);

// Helper widget to track caret position.
class TrackingTextInput extends StatefulWidget {
  const TrackingTextInput({
    Key key,
    this.onCaretMoved,
    this.onTextChanged,
    this.hint,
    this.label,
    this.isObscured = false,
    this.textVisibilityChanged,
  }) : super(key: key);
  final CaretMoved onCaretMoved;
  final TextChanged onTextChanged;
  final String hint;
  final String label;
  final bool isObscured;
  final TextVisibilityChanged textVisibilityChanged;

  @override
  _TrackingTextInputState createState() => _TrackingTextInputState();
}

class _TrackingTextInputState extends State<TrackingTextInput> {
  final GlobalKey _fieldKey = GlobalKey();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focus = FocusNode();

  Timer _debounceTimer;
  bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isObscured;

    _focus.addListener(() {
      if (_focus.hasFocus) {
        widget.textVisibilityChanged?.call(_obscureText);
      }
    });

    _textController.addListener(() {
      // We debounce the listener as sometimes the caret position is updated after the listener
      // this assures us we get an accurate caret position.
      if (_debounceTimer?.isActive ?? false) {
        _debounceTimer.cancel();
      }
      _debounceTimer = Timer(const Duration(milliseconds: 100), () {
        if (_fieldKey.currentContext != null) {
          // Find the render editable in the field.
          final RenderObject fieldBox =
              _fieldKey.currentContext.findRenderObject();
          Offset caretPosition = getCaretPosition(fieldBox);

          if (widget.onCaretMoved != null && !_obscureText) {
            widget.onCaretMoved(caretPosition);
          }
        }
      });
      if (widget.onTextChanged != null) {
        widget.onTextChanged(_textController.text);
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(TrackingTextInput oldWidget) {
    _obscureText = widget.isObscured;
    widget.textVisibilityChanged?.call(_obscureText);

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.label,
          suffixIcon: widget.isObscured
              ? GestureDetector(
                  dragStartBehavior: DragStartBehavior.down,
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });

                    widget.textVisibilityChanged?.call(_obscureText);
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
        ),
        key: _fieldKey,
        controller: _textController,
        obscureText: _obscureText,
        focusNode: _focus,
      ),
    );
  }

  @override
  void dispose() {
    _focus.dispose();
    _textController.dispose();

    super.dispose();
  }
}
