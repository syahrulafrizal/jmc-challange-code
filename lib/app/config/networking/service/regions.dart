import 'dart:convert';
import 'package:jmc_test/app/data/response/regions/response_regions.dart';

import '../../../data/response/default/response_standard.dart';
import '../../constants/endpoint_constant.dart';
import '../client/request.dart';

class Regions {
  static Future list({
    num page = 1,
    num limit = 20,
    String code = "__",
  }) async {
    Map<String, dynamic> data = {
      'kode': code,
      'page': page,
      'each': limit,
    };

    var response = await Request().clientRequest(
      pathUrl: EndpointConstant.REGION,
      requestMethod: REQUEST_METHOD.GET,
      params: data,
      isAuth: false,
    );

    var responseStandard = ResponseStandard.fromJson(json.decode(response.data));

    if (((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299)) {
      return ResponseRegions.fromJson(json.decode(response.data));
    } else {
      return responseStandard;
    }
  }
}
