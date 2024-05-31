import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({super.key, this.buttonText, this.onTap, this.color, this.textColor});
  final String? buttonText;
  final Widget? onTap;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(//détecte les gestes de l'utilisateur, tels que le tap.
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e)=> onTap!,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(30.0),//ka, co,troliw l paddig et l wmaggin f dakjl dyal container
        decoration:  BoxDecoration(
            color: color!,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
            )
        ),
        child: Text(
          buttonText!,
          textAlign: TextAlign.center ,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color : textColor!,
          ),
        ),
      ),
    );
  }
}