import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/library_image.png'),
            SizedBox(height: 20),
            Text(
              'Bienvenue à notre bibliothèque!',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Notre bibliothèque offre une panoplie de livres de différents genres, y compris des romans, des livres de science-fiction, des biographies, des livres pour enfants, et bien plus encore. Que vous soyez un passionné de littérature, un amateur de thrillers, ou à la recherche de connaissances, vous trouverez certainement quelque chose qui vous captivera. Venez explorer notre vaste collection et découvrez votre prochaine lecture préférée!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
