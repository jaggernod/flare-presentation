import 'package:flutter/material.dart';

class MagicBehindFilip extends StatelessWidget {
  const MagicBehindFilip({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(48.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Magic Behind',
            style: Theme.of(context).primaryTextTheme.title,
          ),
          SizedBox(height: 16),
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('assets/filip_code.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
