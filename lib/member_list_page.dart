import 'package:flutter/material.dart';
import 'main.dart';
import 'member_detail_page.dart';
import 'member_form_page.dart';

class Member {
  final String name;
  final String email;
  final String imageUrl;
  final String details;

  Member({required this.name, required this.email, required this.imageUrl, required this.details});
}

class MemberListPage extends StatefulWidget {
  @override
  _MemberListPageState createState() => _MemberListPageState();
}

class _MemberListPageState extends State<MemberListPage> {
  List<Member> members = [
    Member(name: 'Khaoula Allak', email: 'khaoulaallak@gmail.com', imageUrl: 'assets/images/member1.png', details: 'Future ingénieure spécialisée dans le domaine de Big Data et Cloud Computing.'),
    Member(name: 'Fatiha Allak', email: 'fatihaallak@gmail.com', imageUrl: 'assets/images/member2.jpg', details: 'Future ingénieure spécialisée dans le domaine de Big Data et Cloud Computing.'),
  ];

  void _addMember(Member member) {
    setState(() {
      members.add(member);
    });
  }

  void _editMember(int index, Member member) {
    setState(() {
      members[index] = member;
    });
  }

  void _deleteMember(int index) {
    setState(() {
      members.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adhérents'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: ClipOval(
              child: Image.asset(
                members[index].imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(members[index].name),
            subtitle: Text(members[index].email),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberDetailPage(member: members[index]),
                ),
              );
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MemberFormPage(
                          member: members[index],
                          onSave: (updatedMember) {
                            _editMember(index, updatedMember);
                          },
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteMember(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MemberFormPage(
                onSave: (newMember) {
                  _addMember(newMember);
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
