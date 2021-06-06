import 'package:dio/dio.dart';
import 'package:zeb_pay_assignment/model/currency_model.dart';
import 'package:zeb_pay_assignment/utils/strings.dart';

class ApiServices {
  Map<String, String> queryParamter = {
    "vs_currency": "inr",
    "order": "market_cap_desc",
    "per_page": "40",
    "sparkline": "false",
    "page": "1"
  };
  Future<List<Currency>> makeGetRequest(
      {int page = 1, bool filterValue = false}) async {
    try {
      queryParamter["page"] = page.toString();
      queryParamter["order"] = !filterValue ? 'id_asc' : 'id_desc';

      final res = await Dio().get(baseUrl, queryParameters: queryParamter);

      if (res.statusCode == 200) {
        final data = res.data as List;
        if (data.isNotEmpty) {
          return data.map((e) => Currency.fromJson(e)).toList();
        }
        return [];
      }

      return [];
    } on DioError catch (err) {
      throw err.type == DioErrorType.other
          ? 'No Internet Connection'
          : err.response?.statusMessage ?? 'Something went wrong.Please again';
    } catch (e) {
      rethrow;
    }
  }
}
