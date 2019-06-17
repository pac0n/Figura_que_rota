import 'package:flutter/material.dart';

void main() => runApp(Rotation());

class Rotation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter imagen rota',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: RotationPage(title: 'Rotacion de una figura'),
    );
  }
}

class RotationPage extends StatefulWidget {
  RotationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RotationPageState createState() => _RotationPageState();
}

class _RotationPageState extends State<RotationPage> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5),
      vsync: this,
    );
    super.initState();
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RotationTransition(
              turns: _controller,
              child: FlutterLogo(size: 150,),
            ),
          ],
        ),
      ),
    );
  }
}