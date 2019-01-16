import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Filip extends StatefulWidget {
  const Filip({Key key}) : super(key: key);

  @override
  FilipState createState() => FilipState();
}

class FilipState extends State<Filip> {
  Set<OnStage> onStage = Set();

  @override
  void initState() {
    super.initState();

    onStage.add(OnStage.filip);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: InkWell(
        onDoubleTap: () {
          setState(() {
            onStage.add(OnStage.values[onStage.length % OnStage.values.length]);
          });
        },
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'This is Filip',
                  style: Theme.of(context).primaryTextTheme.title,
                ),
              ],
            ),
            SizedBox(width: 16),
            Expanded(
              child: Stack(
                children: [
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: onStage.contains(OnStage.filip) ? 1 : 0,
                    child: FlareActor(
                      'assets/Filip.flr',
                      animation: 'idle',
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: onStage.contains(OnStage.code) ? 0.95 : 0,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset('assets/filip_code.png'),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: onStage.contains(OnStage.data) ? 1 : 0,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset('assets/filip_data.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum OnStage { filip, code, data }
