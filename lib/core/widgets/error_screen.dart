import 'package:flutter/material.dart';

class RouteErrorScreen extends StatefulWidget {
  final String errMsg;
  const RouteErrorScreen({required this.errMsg, super.key});

  @override
  State<RouteErrorScreen> createState() => _RouteErrorScreenState();
}

class _RouteErrorScreenState extends State<RouteErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children:  [
          Center(
            child: Text(widget.errMsg),
          ),
        ],
      ),
    );
  }
}
