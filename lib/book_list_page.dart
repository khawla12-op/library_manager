import 'package:flutter/material.dart';
import 'book_detail_page.dart';
import 'book_form_page.dart';
import 'main.dart';

class Book {
  final String title;
  final String author;
  final String imageUrl;
  final String description;

  Book({required this.title, required this.author, required this.imageUrl, required this.description});
}

class BookListPage extends StatefulWidget {
  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<Book> books = [
    Book(
      title: '1984',
      author: 'George Orwell',
      imageUrl: 'assets/images/book1.jpeg',
      description: 'Un classique dystopique qui explore les dangers du totalitarisme.',
    ),
    Book(
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      imageUrl: 'assets/images/book2.jpeg',
      description: 'Une histoire poignante sur l\'injustice raciale dans le sud des États-Unis.',
    ),
    Book(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      imageUrl: 'assets/images/book1.jpeg',
      description: 'Un roman classique sur l\'amour et la société dans l\'Angleterre du début du XIXe siècle.',
    ),
    Book(
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      imageUrl: 'assets/images/book2.jpeg',
      description: 'Une critique de l\'American Dream à travers la vie extravagante de Jay Gatsby.',
    ),
    Book(
      title: 'Moby-Dick',
      author: 'Herman Melville',
      imageUrl: 'assets/images/book2.jpeg',
      description: 'L\'épique aventure du capitaine Ahab dans sa quête de vengeance contre la baleine blanche Moby Dick.',
    ),
  ];

  void _addBook(Book book) {
    setState(() {
      books.add(book);
    });
  }

  void _editBook(int index, Book book) {
    setState(() {
      books[index] = book;
    });
  }

  void _deleteBook(int index) {
    setState(() {
      books.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livres'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 50,
              height: 75,
              child: Image.asset(
                books[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(books[index].title),
            subtitle: Text(books[index].author),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(book: books[index]),
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
                        builder: (context) => BookFormPage(
                          book: books[index],
                          onSave: (updatedBook) {
                            _editBook(index, updatedBook);
                          },
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteBook(index);
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
              builder: (context) => BookFormPage(
                onSave: (newBook) {
                  _addBook(newBook);
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
