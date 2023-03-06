import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page_animation.dart';
import 'main.dart';

class FormulaireInscription extends StatelessWidget {
  const FormulaireInscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          // ignore: prefer_const_constructors
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageAnimation(
                    delay: 1500,
                    colors: null,
                    child: Text(
                      "Saisissez votre Email et le mot de passe.",
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  PageAnimation(
                    delay: 2500,
                    colors: null,
                    child: Text(
                      "Il est recommandé de nous connecter votre Email pour mieux protéger vos informations. ",
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const InscriptionForm(),
                  const SizedBox(height: 125),
                ],
              ),
            ),
            PageAnimation(
              delay: 5500,
              colors: null,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'CONFIRMER',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InscriptionForm extends StatefulWidget {
  const InscriptionForm({super.key});

  @override
  State<InscriptionForm> createState() => _InscriptionFormState();
}

class _InscriptionFormState extends State<InscriptionForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          PageAnimation(
            delay: 3500,
            colors: null,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Nom',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          PageAnimation(
            delay: 3500,
            colors: null,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Prénom',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          PageAnimation(
            delay: 3500,
            colors: null,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Téléphone',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          PageAnimation(
            delay: 3500,
            colors: null,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          PageAnimation(
            delay: 3500,
            colors: null,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          PageAnimation(
            delay: 4500,
            colors: null,
            child: TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Statut',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
