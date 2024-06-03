import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});

  // Refeito todo o sistema de pontos
  // Alterado o nível que o usuário irá receber
  // Adicionado a pontuação do usuário
  // Adicionado mais um nível para o usuário
  String get fraseResultado {
    if (pontuacao <= 1) {
      return 'Nível Pesca Ilegal!! \n Pontuação: ${pontuacao}';
    } else if (pontuacao == 2) {
      return 'Nossa, Nível Molusco!! \n Pontuação: ${pontuacao}';
    } else if (pontuacao == 3) {
      return 'Eita, Nível Baleia Jubarte!! \n Pontuação: ${pontuacao}';
    } else if (pontuacao == 4) {
      return 'Uauuu, Nível Tubarão Martelo!!! \n Pontuação: ${pontuacao}';
    } else {
      return 'Boaa, As tartarugas vão viver!!! \n Pontuação: ${pontuacao}';
    }
  }

  // Alterado o fontsize do texto da respota e do link para reiniciar
  // Alterado o texto para reiniciar o teste novamente
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 255, 255, 255)
            ),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            'Realizar novamente o teste?',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 36, 202, 3)
            ),
          ),
        ),
      ],
    );
  }
}
