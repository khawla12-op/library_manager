import 'package:flutter/material.dart';
import 'main.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('À propos'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'À propos de l\'application',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'LibraryManager est une application de gestion de bibliothèque qui permet aux utilisateurs de consulter et de gérer les livres et les adhérents. Cette application a été développée dans le but de faciliter l\'organisation et la gestion des ressources bibliothécaires.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Fonctionnalités',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '• Affichage d\'une liste de livres avec des détails complets pour chaque livre.\n'
              '• Gestion des adhérents avec des informations détaillées pour chaque membre.\n'
              '• Navigation simple et intuitive à travers l\'application grâce à un Drawer.\n'
              '• Possibilité d\'ajouter de nouveaux livres et adhérents.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Développement',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Cette application a été développée en utilisant Flutter, un framework open-source créé par Google pour le développement d\'applications multiplateformes. Flutter permet de créer des applications natives de haute qualité pour iOS et Android à partir d\'une seule base de code.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Crédits',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Développeur: Khaoula Allak\n'
              'Email: khaoulaallak@gmail.com\n'
              'Remerciements spéciaux à tous ceux qui ont contribué au développement de cette application.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
