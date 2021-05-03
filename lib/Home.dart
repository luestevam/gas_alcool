import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){

      double precoAlcool = double.tryParse( _controllerAlcool.text );
      double precoGasolina = double.tryParse( _controllerGasolina.text );
      if (precoAlcool == null || precoGasolina == null) {

        setState(() {
          _textoResultado = "Número inválido, digite números maiores que 0 e utilizando ponto (.)";
        });

      } else {
        if ( (precoAlcool / precoGasolina) >= 0.7) {
          setState(() {
            _textoResultado = "Melhor Abastecer com Gasolina";
          });

        } else {
          setState(() {
            _textoResultado = "Melhor Abastecer com Álcool";
          });

        }
      }
      }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Álcool ou Gasolina?"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("images/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Qual melhor opção de abastecimento para seu carro?",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Álcool, ex 1.59"),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Gasolina, ex 3.59"),
                  style: TextStyle(fontSize: 22),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: _calcular,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(_textoResultado,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            ),
          )),
    );
  }
}
