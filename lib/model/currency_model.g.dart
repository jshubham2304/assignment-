// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return Currency(
    id: json['id'] as String,
    symbol: json['symbol'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
    currentPrice: (json['current_price'] as num)?.toDouble(),
    totalVolume: (json['total_volume'] as num)?.toDouble(),
    high24h: (json['high_24h'] as num)?.toDouble(),
    low24h: (json['low_24h'] as num)?.toDouble(),
    priceChange24h: (json['price_change_24h'] as num)?.toDouble(),
    priceChangePercentage24h:
        (json['price_change_percentage_24h'] as num)?.toDouble(),
    totalSupply: (json['total_supply'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'total_volume': instance.totalVolume,
      'high_24h': instance.high24h,
      'low_24h': instance.low24h,
      'price_change_24h': instance.priceChange24h,
      'priceChangePercentage24h': instance.priceChangePercentage24h,
      'totalSupply': instance.totalSupply,
    };
