import 'package:flutter/material.dart';
import 'signaling.dart';

class CallScreen extends StatefulWidget {
  final String calleeId;
  CallScreen({required this.calleeId});

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  late Signaling signaling;

  @override
  void initState() {
    super.initState();
    signaling = Signaling();
    signaling.startCall(widget.calleeId);
  }

  @override
  void dispose() {
    signaling.endCall();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Call')),
      body: Center(
        child: Text('Video/Audio call in progress...'),
      ),
    );
  }
}