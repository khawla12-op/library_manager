import 'package:flutter/material.dart';
import 'member_list_page.dart';

class MemberFormPage extends StatefulWidget {
  final Member? member;
  final Function(Member) onSave;

  MemberFormPage({this.member, required this.onSave});

  @override
  _MemberFormPageState createState() => _MemberFormPageState();
}

class _MemberFormPageState extends State<MemberFormPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _imageUrl;
  late String _details;

  @override
  void initState() {
    super.initState();
    if (widget.member != null) {
      _name = widget.member!.name;
      _email = widget.member!.email;
      _imageUrl = widget.member!.imageUrl;
      _details = widget.member!.details;
    } else {
      _name = '';
      _email = '';
      _imageUrl = '';
      _details = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.member == null ? 'Ajouter un membre' : 'Modifier le membre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer l\'email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                initialValue: _imageUrl,
                decoration: InputDecoration(labelText: 'URL de l\'image'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer l\'URL de l\'image';
                  }
                  return null;
                },
                onSaved: (value) => _imageUrl = value!,
              ),
              TextFormField(
                initialValue: _details,
                decoration: InputDecoration(labelText: 'Détails'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer les détails';
                  }
                  return null;
                },
                onSaved: (value) => _details = value!,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.onSave(
                        Member(
                          name: _name,
                          email: _email,
                          imageUrl: _imageUrl,
                          details: _details,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text(widget.member == null ? 'Ajouter' : 'Sauvegarder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
