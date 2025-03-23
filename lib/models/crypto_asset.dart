import 'package:flutter/material.dart';

class CryptoAsset {
  final String name;
  final String symbol;
  final double price;
  final double change;
  final double holdings;
  final Color color;

  CryptoAsset({
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.holdings,
    required this.color,
  });
}
