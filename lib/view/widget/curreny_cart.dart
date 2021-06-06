import 'package:flutter/material.dart';
import 'package:zeb_pay_assignment/model/currency_model.dart';
import 'package:zeb_pay_assignment/utils/app_color.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CurrenyItem extends StatelessWidget {
  final Currency item;
  final Function onTap;
  CurrenyItem({
    @required this.item,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Center(
                        child: CachedNetworkImage(
                            imageUrl: item?.image, width: 32, height: 32)),
                  ),
                  SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          "${item?.name ?? "-"}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "${item?.symbol ?? "-"}".toUpperCase(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  )
                ],
              ),
              Expanded(
                child: Text(
                  "${item.currentPrice} INR",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
