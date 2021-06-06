import 'package:get/get.dart';
import 'package:zeb_pay_assignment/api/api.dart';
import 'package:zeb_pay_assignment/model/currency_model.dart';
import 'package:zeb_pay_assignment/utils/app_widget.dart';

class CurrenyController extends GetxController {
  List<Currency> listCurrency = [];
  RxInt currentPage = 1.obs;
  ApiServices apiServices = ApiServices();
  RxString errorMessage = ''.obs;
  RxBool filterBool = false.obs;
  List<Currency> serachListCurrency = [];
  RxBool searchBool = false.obs;

  @override
  onReady() {
    listCurrency = [];
    getCurrenyData();
    super.onReady();
  }

  void getNextPage() {
    currentPage.value++;
    getCurrenyData();
  }

  void updateFilter() {
    filterBool.value = !filterBool.value;
    currentPage.value = 1;
    getCurrenyData();
  }

  Future<void> getCurrenyData() async {
    errorMessage.value = '';
    try {
      if (currentPage.value == 1) {
        listCurrency.clear();
      }
      final data = await apiServices.makeGetRequest(
        page: currentPage.value,
        filterValue: filterBool.value,
      );

      if (currentPage.value != 1) {
        listCurrency.addAll(data);
      } else {
        listCurrency = data;
      }
      update();
    } catch (e) {
      errorMessage.value = e.toString();
      AppWidget.errorSnackbar(msg: '$e');
    }
  }

  void inSearch() {
    searchBool.value = !searchBool.value;
  }

  void updateSearchQuery(String newQuery) {
    serachListCurrency.clear();
    listCurrency.forEach((element) {
      if (element.name.toLowerCase().contains(newQuery)) {
        serachListCurrency.add(element);
      }
    });
    update();
  }

  void clearSearch() {
    serachListCurrency.clear();
    searchBool.value = !searchBool.value;
    update();
  }
}
