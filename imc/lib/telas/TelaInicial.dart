import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaIncial extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TelaInicialState();
  }
}

class TelaInicialState extends State<TelaIncial>{
  String _textoResultado = "IMC: __";
  TextEditingController _controllerPeso = new TextEditingController();
  TextEditingController  _controllerAltura = new TextEditingController();
  double _imc = 0;
  String _src = "https://stickers.wiki/static/stickers/homer_jay_simpson/file_123607.webp";
  String _mensagem = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora de IMC"),),
      body: Column(
        children: <Widget>[
          criarCampoTexto("Peso (kg):", _controllerPeso),
          criarCampoTexto("Altura (cm):", _controllerAltura),
          Text(_textoResultado, style: TextStyle(fontSize: 25.0),),
          Container(
            height: 400.0,
            width: 400.0,
            margin: EdgeInsets.only(
              bottom: 20,
              top: 20,
              left: 50,
              right: 50,
            ),
            color: Color(0xffff7f50),
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 350.0,
                  width: 350.0,
                  child: Card(
                    color: Color(0xffff7f50),
                    child: Image.network(_src),
                  ),
                ),
                Text(_mensagem, style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),
          ),
          Container(
            height: 50.0, width: 200.0,
            child: ElevatedButton(
              onPressed: (){
                double? peso = double.tryParse(_controllerPeso.text);
                double? altura = double.tryParse(_controllerAltura.text);
                debugPrint('Peso: $peso');
                debugPrint('Peso: $altura');
                if(peso !=null && altura != null){
                  altura = altura /100.0;
                  _imc = (peso / (altura *altura));
                  setState(() {
                    _textoResultado = 'IMC: $_imc';
                  });
                  if (_imc < 18.5) {
                    setState(() {
                      _src = "https://i.ytimg.com/vi/GWO-4FEuJAI/maxresdefault.jpg";
                      _mensagem = "Abaixo do peso";
                    });
                  }
                  else if (_imc >= 18.5 && _imc < 25 ) {
                    setState(() {
                      _src = "https://pbs.twimg.com/profile_images/1366466342354751491/JyhZpbtu_400x400.jpg";
                      _mensagem = "Peso normal";
                    });;
                  }
                  else if (_imc >= 25 && _imc < 30 ){
                    setState(() {
                      _src = "http://pm1.narvii.com/6478/31ac1cc4b69f3bc6733883164ddfcb643acdaac4_00.jpg";
                      _mensagem = "Sobrepeso";
                    });
                  }
                  else if (_imc >= 30 && _imc < 35) {
                    setState(() {
                      _src = "https://static.wikia.nocookie.net/dragonball/images/e/e4/MajinBuuSuperNV..png/revision/latest?cb=20150121003048&path-prefix=pt-br";
                      _mensagem = "Obesidade grau 1";
                    });
                  }
                  else if (_imc >= 35 && _imc < 40) {
                    setState(() {
                      _src = "https://kanto.legiaodosherois.com.br/w728-h381-gnw-cfill-gcc/wp-content/uploads/2021/10/legiao_0Ovd7XqbTIos.png.jpeg";
                      _mensagem = "Obesidade grau 2";
                    });
                  }
                  else if (_imc >= 40) {
                    setState(() {
                      _src = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b6f53bda-0e78-40b9-9213-d5a7807bf049/delaa06-c8124d53-c107-4e83-a98d-cfd70b8fd31f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2I2ZjUzYmRhLTBlNzgtNDBiOS05MjEzLWQ1YTc4MDdiZjA0OVwvZGVsYWEwNi1jODEyNGQ1My1jMTA3LTRlODMtYTk4ZC1jZmQ3MGI4ZmQzMWYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.1UTRlKxcgkHS8MTm5rxsRJrtaSE3EGI0Myj63vbkK24";
                      _mensagem = "Obesidade grau 3 ou Mórbida";
                    });
                  }
                  else{
                    setState(() {
                      _src = "https://static.wikia.nocookie.net/simpsons/images/b/bf/Homer-doh-square.jpg/revision/latest?cb=20110516212209&path-prefix=pt";
                      _mensagem = "Não foi possivel calcular ;-;";
                    });
                  }
                } else{
                  setState(() {
                    _textoResultado = 'Preencha os campos para IMC';
                  });
                }
              },
              child: Text("Calcular IMC"),
            ),
          ),
        ],
      ),
    );
  }

  TextField criarCampoTexto(String texto, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: texto,
          border: OutlineInputBorder(),
          labelStyle: TextStyle(
              fontSize: 25.0, color: Colors.blue
          )
      ),
    );
  }
  
}