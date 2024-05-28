import 'package:flutter/material.dart';
import 'member_list_page.dart';

class MemberDetailPage extends StatelessWidget {
  final Member member;

  MemberDetailPage({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(member.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(member.imageUrl),
            SizedBox(height: 16),
            Text(
              member.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              member.email,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(member.details),
          ],
        ),
      ),
    );
  }
}
