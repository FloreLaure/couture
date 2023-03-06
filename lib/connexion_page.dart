// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'page_animation.dart';
import 'login_page.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: unused_import
import 'formulaire_inscrip.dart';

// class ConnexionPage extends StatelessWidget {
//   const ConnexionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//             size: 30,

//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           ),

//       ),
//       body: SingleChildScrollView(

//         child:Column(
//           children: [

//             PageAnimation(
//               delay: 1000,
//               colors: null,
//               child: SizedBox(

//                 height: 250,

//                 child: Image.asset('assets/images/corps.jpg'),
//               ),
//               ),

//             PageAnimation(
//               delay: 3500,
//               colors: null,
//               child: Container(
//                 height: 314,
//                 width: 3000,
//                 color: Colors.blue[900],

//                 // code pour les buton connexion et s'inscrire

//              child: PageAnimation(
//                delay: 1000,
//                colors: null,
//                child: Container(
//                  margin: const  EdgeInsets.symmetric(
//                    vertical: 80,
//                    horizontal: 20,
//                   //  vertical: 14,
//                   //  horizontal: 40,
//                  ),

//                  child: Column(
//                    children: [
//                      ElevatedButton(
//                        onPressed: () {
//                          Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const LoginPage(),
//                             ));

//                        },
//                          style: ElevatedButton.styleFrom(
//                          backgroundColor: Colors.white,
//                          shape: const StadiumBorder(),
//                          padding: const EdgeInsets.all(13),
//                        ),
//                         child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          // ignore: prefer_const_literals_to_create_immutables
//                          children: [
//                            const Text(
//                             'Connexion',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                          ],
//                         )
//                         ),

//                         const SizedBox(height: 35),

//                      ElevatedButton(
//                        onPressed: () {},
//                          style: ElevatedButton.styleFrom(
//                          backgroundColor: Colors.white,
//                          shape: const StadiumBorder(),
//                          padding: const EdgeInsets.all(13),
//                        ),
//                         child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          // ignore: prefer_const_literals_to_create_immutables
//                          children: [
//                            const Text(
//                             "S'inscrire",
//                              style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               ),

//                             ),
//                          ],
//                         )
//                         )

//                  ]),
//                ),
//                ) ,

//                 )
//               ),
//           ],
//         ) ,
//         ),

//     );
//   }
// }

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          // ignore: prefer_const_constructors
          icon: Icon(
            Icons.arrow_back,
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
            PageAnimation(
              delay: 1500,
              colors: null,
              child: SizedBox(
                height: 280,
                child: Image.asset('assets/images/lg.png'),
              ),
            ),
            PageAnimation(
              delay: 2500,
              colors: null,
              child: Container(   
              margin: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 30,

                ),
                child: Column(
                  children: [
                    Text(
                      " Le changement commence ici!!!!",
                      style: GoogleFonts.poppins(
                        color: Colors.blue[900],
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Clicker 'se connecter' si vous aviez déjà un compte et 'Inscrire' si vous ne l'aviez pas.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            PageAnimation(
              delay: 3500,
              colors: null,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 40,
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.blue[900],
                        padding: const EdgeInsets.all(13),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Se connecter',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FormulaireInscription(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.blue[900],
                        padding: const EdgeInsets.all(13),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " S'inscrire",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
