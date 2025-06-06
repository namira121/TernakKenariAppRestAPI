import 'dart:convert';

class IndukRequestModel {
    final String? noRing;
    final DateTime? tanggalLahir;
    final String? jenisKelamin;
    final String? jenisKenari;
    final String? keterangan;
    final String? gambarIndukBase64;

    IndukRequestModel({
        this.noRing,
        this.tanggalLahir,
        this.jenisKelamin,
        this.jenisKenari,
        this.keterangan,
        this.gambarIndukBase64,
    });

    factory IndukRequestModel.fromRawJson(String str) => IndukRequestModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IndukRequestModel.fromJson(Map<String, dynamic> json) => IndukRequestModel(
        noRing: json["no_ring"],
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        jenisKenari: json["jenis_kenari"],
        keterangan: json["keterangan"],
        gambarIndukBase64: json["gambar_induk_base64"],
    );

    Map<String, dynamic> toJson() => {
        "no_ring": noRing,
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "jenis_kenari": jenisKenari,
        "keterangan": keterangan,
        "gambar_induk_base64": gambarIndukBase64,
    };
}
