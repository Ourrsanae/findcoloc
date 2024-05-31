import 'package:findcoloc/themes/custom_scoffold.dart';
import 'package:findcoloc/themes/theme.dart';
import 'package:findcoloc/themes/welcome_button.dart';
import 'package:findcoloc/view/signin/signin.dart';
import 'package:findcoloc/view/signup/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';//cpnstruire les interfaces gutilisateur de l'app o feh les fctionnalites importantt de flutter


class WelcomeScreen extends StatelessWidget{//maghadish ibdl lina l'etat dyalo bsba les donnees
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context){//build :pour définir la structure de l'interface utilisateur de l'écran de bienvenue.
    return CustomScaffold(
      child: Column(//Column, qui est utilisé pour disposer ses enfants de manière verticale, les uns en dessous des autres.
        children: [//children: [ ... ], : Vous définissez les enfants de la colonne à l'intérieur de crochets [ ]. Ces enfants sont les widgets qui seront disposés verticalement dans la colonne.
          Flexible(//permet de contrôler la façon dont l'espace est réparti entre les enfants de la colonne.
              flex: 7,
              child: Container(
                padding: const EdgeInsets.symmetric(// un remplissage symétrique
                  vertical: 0,
                  horizontal: 20.0,
                ),
                child: Center(
                  child: RichText(
                    //permet d'afficher du texte avec différentes mises en forme à l'aide de TextSpan
                    textAlign: TextAlign.center,//centré horizontalement
                    text: const TextSpan(
                        children: [
                          TextSpan(
                              text: 'Welcome To House Mate Hub! \n',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w600,
                              )),
                          TextSpan(
                              text: '\n your go-to platform for finding the perfect roommate or rental property',
                              style: TextStyle(
                                fontSize: 20,
                              )
                          )
                        ]
                    ),
                  ),
                ),
              )),
          Flexible(
            flex: 1,
            child:Align(
              alignment: Alignment.bottomRight,
              child: Row(//Row pour disposer ses enfants de manière horizontale, les uns à côté des autres
                children: [
                  const Expanded(// Vous utilisez le widget Expanded pour permettre à ses enfants de s'étendre pour remplir l'espace disponible dans la rangée.
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: SignInScreen(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: const SignUpScreen(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}