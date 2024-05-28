import 'package:flutter/material.dart';
// import 'main.dart';
import 'book_list_page.dart';


class BookFormPage extends StatefulWidget {
  final Book? book;
  final Function(Book) onSave;

  BookFormPage({this.book, required this.onSave});

  @override
  _BookFormPageState createState() => _BookFormPageState();
}

class _BookFormPageState extends State<BookFormPage> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _author;
  late String _imageUrl;
  late String _description;

  @override
  void initState() {
    super.initState();
    if (widget.book != null) {
      _title = widget.book!.title;
      _author = widget.book!.author;
      _imageUrl = widget.book!.imageUrl;
      _description = widget.book!.description;
    } else {
      _title = '';
      _author = '';
      _imageUrl = '';
      _description = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book == null ? 'Ajouter un livre' : 'Modifier le livre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(labelText: 'Titre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le titre';
                  }
                  return null;
                },
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                initialValue: _author,
                decoration: InputDecoration(labelText: 'Auteur'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer l\'auteur';
                  }
                  return null;
                },
                onSaved: (value) => _author = value!,
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
                initialValue: _description,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la description';
                  }
                  return null;
                },
                onSaved: (value) => _description = value!,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.onSave(
                        Book(
                          title: _title,
                          author: _author,
                          imageUrl: _imageUrl,
                          description: _description,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text(widget.book == null ? 'Ajouter' : 'Sauvegarder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
