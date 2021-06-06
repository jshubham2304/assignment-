import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeb_pay_assignment/controller/currency_controller.dart';
import 'package:zeb_pay_assignment/utils/app_color.dart';
import 'package:zeb_pay_assignment/view/widget/animated_reloader.dart';
import 'package:zeb_pay_assignment/view/widget/bottom_sheet.dart';
import 'package:zeb_pay_assignment/view/widget/curreny_card.dart';
import 'package:zeb_pay_assignment/view/widget/filter_option.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation colorAnimation;
  Animation rotateAnimation;
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();

    animController =
        AnimationController(vsync: this, duration: Duration(seconds: 200));
    rotateAnimation =
        Tween<double>(begin: 0.0, end: 360.0).animate(animController);
    _scrollController.addListener(_scrollListener);
    final db = Get.find<CurrenyController>();
    db.getCurrenyData();
  }

  @override
  void dispose() {
    animController.dispose();
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        (_scrollController.position.maxScrollExtent)) {
      final controller = Get.find<CurrenyController>();
      controller.getNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CurrenyController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Obx(
            () => controller.searchBool.value
                ? _buildSearchField()
                : Center(
                    child: Image(
                      image: const AssetImage('assets/images/logo_icon.png'),
                      width: 38,
                      height: 38,
                      fit: BoxFit.contain,
                    ),
                  ),
          ),
          leading: IconButton(
            icon: Icon(Icons.search, color: Colors.white, size: 26),
            onPressed: () => controller.inSearch(),
          ),
          actions: [
            Obx(
              () => controller.searchBool.value
                  ? SizedBox()
                  : AnimatedReloader(
                      animation: rotateAnimation,
                      callback: () async {
                        animController.forward();
                        controller.currentPage.value = 1;
                        await controller.getCurrenyData();
                        animController.stop();
                        animController.reset();
                      },
                    ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Obx(
                () => FilterButton(
                  onTap: controller.updateFilter,
                  isAscending: !controller.filterBool.value,
                ),
              ),
            ),
            Expanded(
              child: GetBuilder<CurrenyController>(
                builder: (controller) {
                  if (controller.errorMessage.value != '') {
                    return Center(
                      child: Text(
                        controller.errorMessage.value,
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  }
                  if (controller?.listCurrency?.length == 0 ?? true) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: controller.searchBool.value
                        ? controller?.serachListCurrency?.length ?? 0
                        : controller?.listCurrency?.length ?? 0,
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    itemBuilder: (context, index) {
                      return CurrenyItem(
                        item: controller.searchBool.value
                            ? controller.serachListCurrency[index]
                            : controller.listCurrency[index],
                        onTap: () {
                          showCoinDetailBottomSheet(
                            context,
                            controller.searchBool.value
                                ? controller.serachListCurrency[index]
                                : controller.listCurrency[index],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    final controller = Get.find<CurrenyController>();
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: controller.clearSearch,
        ),
        hintStyle: const TextStyle(color: Colors.white),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16),
      onChanged: controller.updateSearchQuery,
    );
  }
}
