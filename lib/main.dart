import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _mensagem= "Por favor informe seus dados";


  void _reset(){
    pesoController.text="";
    alturaController.text="";
    setState(() {
      _mensagem="Por favor informe seus dados";
      _formKey= GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Semantics( child: const Text("IMC"), label: "Calculadora de Índice de Massa Corporal",),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions:[
          Semantics( child: IconButton(onPressed: _reset, icon:Icon(Icons.refresh)), label: "Limpar dados inseridos",)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,/// fazer
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Semantics(
                  child: const Icon(Icons.person_outline, size: 100, color: Color(0XFF1921D2)),
                  label: "Ícone do usuário"
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Peso em quilos",
                        labelStyle: TextStyle(color: Color(0XFF1921D2), fontWeight: FontWeight.bold)),
                    textAlign: TextAlign.center,
                    style: const TextStyle (color: Color(0XFF1921D2), fontSize: 30, fontWeight: FontWeight.bold),
                    controller: pesoController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Informe o seu peso!";
                      }
                    }
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Sua altura em CM",
                        labelStyle: TextStyle(color: Color(0XFF1921D2), fontWeight: FontWeight.bold)),
                    textAlign: TextAlign.center,
                    style: const TextStyle (color: Color(0XFF1921D2), fontSize: 30, fontWeight: FontWeight.bold),
                    controller: alturaController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Informe sua altura!";
                      }
                    }
                ),
                
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    height: 60,
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          ///executa algo
                          _calcular();
                        }
                      },
                      child: const Text("Calcular",
                        style: TextStyle(color: Color(0XFF1921D2), fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Text(_mensagem,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0XFF1921D2), fontSize: 30, fontWeight: FontWeight.bold),
                  
                )
              ],
            )
        ),
      ),
    );
  }

// Adicionar: semanticLabel: 'Botão Calcular'

  void _calcular(){
    setState(() {
      double peso=double.parse(pesoController.text);
      double altura=(double.parse(alturaController.text))/100;
      double imc= peso/(altura*altura);
      _mensagem = "IMC ${imc.toStringAsPrecision(2)}\n";
      if (imc < 18.6)
        _mensagem += "Abaixo do peso";
      else if (imc < 25.0)
        _mensagem += "Peso ideal";
      else if (imc < 30.0)
        _mensagem += "Levemente acima do peso";
      else if (imc < 35.0)
        _mensagem += "Obesidade Grau I";
      else if (imc < 40.0)
        _mensagem += "Obesidade Grau II";
      else
        _mensagem += "Obesidade Grau IIII";
    });
  }
}

