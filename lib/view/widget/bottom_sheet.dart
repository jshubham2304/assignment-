import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zeb_pay_assignment/model/currency_model.dart';

void showCoinDetailBottomSheet(BuildContext context, Currency item) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (context) {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shrinkWrap: true,
        children: [
          _renderListTile(item),
          SizedBox(height: 8),
          _renderOneDayHigh(item),
          SizedBox(height: 8),
          _renderOneDayLow(item),
        ],
      );
    },
  );
}

Widget _renderOneDayLow(Currency item) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '24hr Low',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      Text(
        '${item?.low24h ?? 0.0} INR',
        style: const TextStyle(color: Colors.red, fontSize: 14),
      ),
    ],
  );
}

Widget _renderOneDayHigh(Currency item) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '24hr High',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Text(
            '${item?.high24h ?? 0.0} INR',
            style: const TextStyle(color: Colors.green, fontSize: 14),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '24hr Change',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Text(
            '${item?.priceChangePercentage24h ?? 0.0} %',
            style: TextStyle(
              color: item?.priceChangePercentage24h != null &&
                      item.priceChangePercentage24h.isNegative
                  ? Colors.red
                  : Colors.green,
              fontSize: 14,
            ),
          ),
        ],
      )
    ],
  );
}

Widget _renderListTile(Currency item) {
  return ListTile(
    leading: Container(
      width: 36,
      height: 36,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: CachedNetworkImage(
        imageUrl: item?.image,
        fit: BoxFit.contain,
      ),
    ),
    contentPadding: EdgeInsets.zero,
    title: Text(
      item?.name ?? 'NA',
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text(
      item?.symbol?.toUpperCase() ?? 'NA',
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    ),
    trailing: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text((item?.currentPrice?.toString() ?? '') + ' INR'),
        Text(
          'vol ${item?.totalVolume ?? 0.0}',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    ),
  );
}
