import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'call_screen.dart';

class UsersListScreen extends StatelessWidget {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final user = docs[index];
              return ListTile(
                title: Text(user['email']),
                trailing: IconButton(
                  icon: Icon(Icons.video_call),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CallScreen(calleeId: user.id),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}