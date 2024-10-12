import 'package:jmc_test/app/data/response/default/response_standard.dart';

class ResponseRegions implements ResponseModel {
  num? page;
  num? totalPage;
  num? totalData;
  num? dataCount;
  List<Region>? data;

  ResponseRegions({
    this.page,
    this.totalPage,
    this.totalData,
    this.dataCount,
    this.data,
  });

  factory ResponseRegions.fromJson(Map<String, dynamic> json) => ResponseRegions(
        page: json["page"],
        totalPage: json["total_page"],
        totalData: json["total_data"],
        dataCount: json["data_count"],
        data: json["data"] == null ? [] : List<Region>.from(json["data"]!.map((x) => Region.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "total_page": totalPage,
        "total_data": totalData,
        "data_count": dataCount,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Region {
  String? kode;
  String? nama;

  Region({
    this.kode,
    this.nama,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        kode: json["kode"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "nama": nama,
      };
}
