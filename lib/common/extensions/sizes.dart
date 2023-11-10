import 'package:flutter/material.dart';

class Sizes {
  //Construtor privado.
  Sizes._();

  //Irá receber novos valores.
  double _width = 0;
  double _height = 0;

  //Valor do tamanho do prototico do Figma.
  static const Size _designSize = Size(414.0, 896.0);

  static final Sizes _instance = Sizes._();

  //Construtor Singleton.
  factory Sizes() => _instance;

  double get width => _width;
  double get height => _height;

  //Método de configuração inicial.
  static void init(
    BuildContext context, {
    Size designSize = _designSize,
  }) {
    //Verifica se existe dados de MediaQuery.
    final deviceData = MediaQuery.maybeOf(context);

    //Caso não existir, recebe o valor inicial do prototico do Figma.
    final deviceSize = deviceData?.size ?? _designSize;

    //Atualiza Getters
    _instance._height = deviceSize.height;
    _instance._width = deviceSize.width;
  }
}

extension SizeExt on num {
  //Calcula o valor proporcional baseado na largura do dispositivo em relação ao prototico.
  double get w {
    return (this * Sizes._instance._width) / Sizes._designSize.width;
  }

  //Calcula o valor proporcional baseado na altura do dispositivo em relação ao prototico.
  double get h {
    return (this * Sizes._instance._height) / Sizes._designSize.height;
  }
}
