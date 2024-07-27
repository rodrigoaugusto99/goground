import 'package:flutter/material.dart';

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

//todo: fazer essa animacao implicita, entender, e dps deixar mais complexa usando controller

/*
essas animacoes implicitas sao feitas quando o estado eh atualizado, de forma suave com duration e animacao
personalizada. se fosse o Align normal, sem o AnimatedAlign, ao atualizar o estado, o negocio iria mudar num 
piscar de olhos

fazer animacao personlaizada usando a classe Curve

usar futureBuilder e StreamBuilder pra fzr as animacoes, sem usar StatefulBuilder com setState

usar TweenAnimationBuilder caso nao tena um AnimatedFoo. 
 - sem setState
 - setar valores iniciais e finais em "tween"
 - setar curve
 - setar onEnd - mais valores, pode fazer uma animacao reverse, tipo voltar ao q era antes por ex.
 - child (d obuilder) p otimizacao
 */

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          width: 250.0,
          height: 250.0,
          color: Colors.red,
          child: AnimatedAlign(
            alignment: selected ? Alignment.topCenter : Alignment.centerLeft,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: const FlutterLogo(size: 50.0),
          ),
        ),
      ),
    );
  }
}
