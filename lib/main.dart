import 'package:flutter/material.dart';
import 'home_page.dart';
import 'book_list_page.dart';
import 'member_list_page.dart';
import 'about_page.dart';
// import 'book_form_page.dart'; 

void main() {
  runApp(LibraryManager());
}

class LibraryManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Manager',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/library_logo.png', // Assurez-vous que cette image existe dans le dossier assets
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Bibliothèque publique',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Livres'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookListPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Adhérents'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MemberListPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
