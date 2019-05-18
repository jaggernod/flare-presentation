import 'package:flutter/material.dart';
import 'package:flutter_app/pages/widgets/presentation_border.dart';

class WebTool extends StatelessWidget {
  const WebTool({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How is it made?',
            style: Theme.of(context).primaryTextTheme.title,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: PresentationBorder(
                  child: Image.asset('assets/web_tool.png'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '- 2dimensions.com',
              style: Theme.of(context).primaryTextTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
