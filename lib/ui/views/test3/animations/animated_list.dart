import 'dart:developer';

import 'package:flutter/material.dart';

class AnimatedListSample extends StatefulWidget {
  const AnimatedListSample({super.key});

  @override
  _AnimatedListSampleState createState() => _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final textEC = TextEditingController();
  List<String> items = [];

/*
Quando adicionamos ou removemos itens, precisamos atualizar tanto a lista de dados
(items) quanto a AnimatedList para garantir que a interface reflita corretamente o estado atual dos dados.
 */
  void _addItem() {
    if (textEC.text.isEmpty) return;
    items.add(textEC.text);
    //tbm precisa fazer a insercao e exclusao na key
    _listKey.currentState?.insertItem(
      items.length - 1,
      duration: const Duration(milliseconds: 1000),
    );
    textEC.clear();
  }

  void _removeItem(int index, String text) {
    items.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildRemovedItem(text, animation),
      duration: const Duration(milliseconds: 1000),
    );
  }

  Widget _buildItem(Animation<double> animation, int index, String text) {
    return RotationTransition(
      turns: animation,
      child: SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            //inicio da posicao do widget - direita (fora da tela)
            begin: const Offset(1, 0),
            //termina na posicao final do widget
            end: Offset.zero,
            //chain pra adicionar mais uma animacao ( animar a animacao de position do slide)
          ).chain(CurveTween(curve: Curves.slowMiddle)),
        ),
        child: Card(
          color: Colors.orange,
          child: ListTile(
            title: Text(text),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeItem(index, text),
            ),
          ),
        ),
      ),
    );
  }

/*
aqui eh o build do item no momento da exclusao. veja que estamos recriando
o card, pois eh aqui que o card excluido eh construido antes de ser animado
para ser deletado. Sem esse build, o frameworkd nao saberia como renderizar o item
durante a remocao do objeot.

veja que podemos trocar o texto, a cor, etc. Podemos trocar ate o widget todo(o child)
 */
  Widget _buildRemovedItem(String itemText, Animation<double> animation) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.elasticOut)),
      ),
      child: Card(
        color: Colors.red,
        //aqui colcoamos efeito de size justamente para animar o resto da lista debaixo ao subir.
        child: SizeTransition(
          sizeFactor: animation,
          child: ListTile(
            title: Text(itemText),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: textEC,
            ),
            ElevatedButton(
              onPressed: _addItem,
              child: const Text('Add Item'),
            ),
            Expanded(
              child: AnimatedList(
                key: _listKey,
                itemBuilder: (context, index, animation) {
                  return _buildItem(animation, index, items[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
