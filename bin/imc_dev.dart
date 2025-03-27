import 'dart:io';

void main(List<String> arguments) {
  print("Digite seu nome");
  String? seuNome = stdin.readLineSync();
  print("Digite seu Peso");
  String? seuPeso = stdin.readLineSync();
  print("Digite sua Altura");
  String? suaAltura = stdin.readLineSync();

// Verificar se os valores não são nulos antes de fazer o parse

  if (seuPeso != null && suaAltura != null) {
    double p = double.parse(seuPeso);
    double a = double.parse(suaAltura);

    Pessoa pessoa = Pessoa(p, a); // 70 kg e 1.75 m
    double imc = pessoa.calcularIMC();
    String classificacao = pessoa.classificarIMC();

    print('Seu nome: $seuNome');
    print('IMC: ${imc.toStringAsFixed(2)}');
    print('Classificação: $classificacao');
  }
}

class Pessoa {
  double peso; // em quilogramas
  double altura; // em metros

  Pessoa(this.peso, this.altura);

  double calcularIMC() {
    return peso / (altura * altura);
  }

  String classificarIMC() {
    double imc = calcularIMC();
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc >= 18.5 && imc < 24.9) {
      return 'Peso normal';
    } else if (imc >= 25 && imc < 29.9) {
      return 'Sobrepeso';
    } else {
      return 'Obesidade';
    }
  }
}
