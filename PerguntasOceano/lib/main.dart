import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

// Alterado as questões
// Adicionado mais uma alternativa em cada resposta
// Alterado a quantidade de pontos de cada altenativa
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é o maior oceano?',
      'respostas': [
        {'texto': 'Oceano Pacífico', 'pontuacao': 1},
        {'texto': 'Oceano ìndico', 'pontuacao': 0},
        {'texto': 'Oceano Atlântico', 'pontuacao': 0},
        {'texto': 'Oceano Artico', 'pontuacao': 0},
        {'texto': 'Oceano Antartico', 'pontuacao': 0},
      ],
    },
    {
      'texto':
          'Qual é uma prática de pesca suntentavel que visa evitar a captura de espécies não alvo?',
      'respostas': [
        {'texto': 'Pesca de arrasto', 'pontuacao': 0},
        {'texto': 'Pesca de cerco', 'pontuacao': 0},
        {'texto': 'Pesca de linha e anzol', 'pontuacao': 0},
        {'texto': 'Pesca de rede de emalhe', 'pontuacao': 1},
        {'texto': 'Pesca de explosivos', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é uma ameaça ambiental para os recifes de coral?',
      'respostas': [
        {'texto': 'Acidificação dos oceanos', 'pontuacao': 0},
        {'texto': 'Erosão costeira', 'pontuacao': 0},
        {'texto': 'Poluição por plásticos', 'pontuacao': 1},
        {'texto': 'Pesca predatória', 'pontuacao': 0},
        {'texto': 'Aquecimento Global', 'pontuacao': 0},
      ],
    },
    {
      'texto':
          'Qual medida sustentável que pode ajudar a proteger as tartarugas marinhas?',
      'respostas': [
        {'texto': 'Despejo de lixo no mar', 'pontuacao': 0},
        {
          'texto': 'Utilização de sacolas plásticas descartáveis',
          'pontuacao': 0
        },
        {'texto': 'Redução da pesca de arrasto', 'pontuacao': 1},
        {
          'texto': 'Aumento do turismo em praias de nidificação',
          'pontuacao': 0
        },
        {'texto': 'Desmatamento das áreas de desova', 'pontuacao': 0},
      ],
    },
    {
      'texto':
          'Qual é uma iniciativa sustentável para a conservação dos oceanos?',
      'respostas': [
        {'texto': 'Implementação de áreas marinhas protegidas', 'pontuacao': 1},
        {'texto': 'Aumento da poluição industrial', 'pontuacao': 0},
        {'texto': 'Utilização de plásticos descatáveis', 'pontuacao': 0},
        {
          'texto': 'Captura indiscriminada de espécies marinhas',
          'pontuacao': 0
        },
        {'texto': 'Descartes de resíduos químicos no oceano', 'pontuacao': 0},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  // Alterado o nome que aparece acima na aplicação do celular (Linha 70)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas Oceano'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: temPerguntaSelecionada
                  ? Questionario(
                      perguntas: _perguntas,
                      perguntaSelecionada: _perguntaSelecionada,
                      quandoResponder: _responder,
                    )
                  : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
            ),
            Positioned(
              bottom: 10.0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/oceans20.png",
                    height: 100.0, width: 100.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
