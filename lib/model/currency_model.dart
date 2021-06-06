import 'package:json_annotation/json_annotation.dart';
part 'currency_model.g.dart';

@JsonSerializable()
class Currency {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  double totalVolume;
  double high24h;
  double low24h;
  double priceChange24h;
  double priceChangePercentage24h;
  double totalSupply;

  Currency({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.totalSupply,
  });
  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
