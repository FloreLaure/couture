import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'page_animation.dart';
import 'connexion_page.dart';

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//             margin: const EdgeInsets.symmetric(
//               vertical: 60,
//               horizontal: 30,
//             ),
//             child: Column(
//               children: [
//                 PageAnimation(
//                   delay: 2500,
//                   colors: null,
//                   child: SizedBox(
//                     height: 350,
//                     child: Image.asset('assets/images/corps.jpg'),
//                   ),
//                 ),
                
//                 PageAnimation(
//                   delay: 3500,
//                   colors: null,
//                   child: SizedBox(
//                     height: 100,
//                     child: Text(
//                       "Mobile couture, un moyen simple,sur et fiable pour les taillleurs de faciliter leurs travaille, et de communiquer avec leur clientèle. ",
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.poppins(
//                         color: Colors.grey,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//                 PageAnimation(
//                   delay: 4500,
//                   colors: null,
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue[900],
//                         shape: const StadiumBorder(),
//                         padding: const EdgeInsets.all(13),
//                       ),
//                       child: const Text(
//                         'Accepter et continuer',
//                         style: TextStyle(
//                         ),

//                         ),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const ConnexionPage(),
//                             ));
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
// }



class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              PageAnimation(
                delay: 1500,
                colors: null,
                child: SizedBox(
                  height: 170,
                  child: Image.asset('assets/images/lg.png'),
                ),
              ),
              PageAnimation(
                delay: 2500,
                colors: null,
                child: SizedBox(
                  height: 400,
                  child: Image.asset('assets/images/lg.png'),
                ),
              ),
              PageAnimation(
                delay: 3500,
                colors: null,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    "Mobile couture, un moyen simple,sur et fiable pour les taillleurs de faciliter leurs travaille, et de communiquer avec leur clientèle.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              PageAnimation(
                delay: 4500,
                colors: null,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.all(13)),
                    child: const Text('ACCEPTER ET CONTINUER'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConnexionPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}