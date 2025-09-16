import 'package:flutter_webrtc/flutter_webrtc.dart';

class Signaling {
  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;

  Future<void> startCall(String calleeId) async {
    _localStream = await navigator.mediaDevices.getUserMedia({'video': true, 'audio': true});
    _peerConnection = await createPeerConnection({}, {});
    _peerConnection!.addStream(_localStream!);

    // Здесь можно добавить Firestore или WebSocket сигналинг
  }

  void endCall() {
    _localStream?.dispose();
    _peerConnection?.close();
  }
}