import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zeb_pay_assignment/model/currency_model.dart';

class CurrenyItem extends StatelessWidget {
  final Currency item;
  final Function onTap;

  CurrenyItem({
    @required this.item,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        onTap: onTap,
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
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        title: Text(
          item?.name ?? 'NA',
          style: const TextStyle(fontSize: 14),
        ),
        subtitle: Text(
          item?.symbol?.toUpperCase() ?? 'NA',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        trailing: Text((item?.currentPrice?.toString() ?? '') + ' INR'),
      ),
    );
  }
}
