import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  final _kmRodadosController = TextEditingController();
  final _litrosCombustivelController = TextEditingController();
  final _valorCombustivelController = TextEditingController();

  double _consumoMedio = 0.0;
  double _gastoMedio = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Combustível'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0), // adiciona margem
              child: TextFormField(
                controller: _kmRodadosController,
                decoration: InputDecoration(labelText: 'KM Rodados'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), // adiciona margem
              child: TextFormField(
                controller: _litrosCombustivelController,
                decoration: InputDecoration(labelText: 'Litros de Combustível'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), // adiciona margem
              child: TextFormField(
                controller: _valorCombustivelController,
                decoration: InputDecoration(labelText: 'Valor do Combustível'),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final kmRodados = double.parse(_kmRodadosController.text);
                final litrosCombustivel = double.parse(_litrosCombustivelController.text);
                final valorCombustivel = double.parse(_valorCombustivelController.text);
                setState(() {
                  _consumoMedio = kmRodados / litrosCombustivel;
                  _gastoMedio = valorCombustivel / _consumoMedio;
                });
              },
              child: Text('Calcular'),
            ),
            Text(
              'Consumo Médio: ${_consumoMedio.toStringAsFixed(2)} KM/L',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Gasto Médio: R\$ ${_gastoMedio.toStringAsFixed(2)} por KM',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}