// ignore_for_file: annotate_overrides, unnecessary_question_mark

abstract class ResponseModel {
  final num? page;
  final num? totalPage;
  final num? totalData;
  final num? dataCount;
  final dynamic data;

  ResponseModel({
    this.page,
    this.totalPage,
    this.totalData,
    this.dataCount,
    this.data,
  });
}

class ResponseStandard implements ResponseModel {
  num? page;
  num? totalPage;
  num? totalData;
  num? dataCount;
  dynamic data;

  ResponseStandard({
    this.page,
    this.totalPage,
    this.totalData,
    this.dataCount,
    this.data,
  });

  factory ResponseStandard.fromJson(Map<String, dynamic> json) => ResponseStandard(
        page: json["page"],
        totalPage: json["total_page"],
        totalData: json["total_data"],
        dataCount: json["data_count"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "total_page": totalPage,
        "total_data": totalData,
        "data_count": dataCount,
        "data": data,
      };
}
