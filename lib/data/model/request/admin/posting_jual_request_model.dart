import 'dart:convert';

class PostingJualRequestModel {
    final String? noRing;
    final DateTime? tanggalLahir;
    final String? jenisKelamin;
    final String? jenisKenari;
    final String? gambarAnakBase64;
    final int? ayahId;
    final int? ibuId;

    PostingJualRequestModel({
        this.noRing,
        this.tanggalLahir,
        this.jenisKelamin,
        this.jenisKenari,
        this.gambarAnakBase64,
        this.ayahId,
        this.ibuId,
    });

    factory PostingJualRequestModel.fromRawJson(String str) => PostingJualRequestModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PostingJualRequestModel.fromJson(Map<String, dynamic> json) => PostingJualRequestModel(
        noRing: json["no_ring"],
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        jenisKenari: json["jenis_kenari"],
        gambarAnakBase64: json["gambar_anak_base64"],
        ayahId: json["ayah_id"],
        ibuId: json["ibu_id"],
    );

    Map<String, dynamic> toJson() => {
        "no_ring": noRing,
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "jenis_kenari": jenisKenari,
        "gambar_anak_base64": gambarAnakBase64,
        "ayah_id": ayahId,
        "ibu_id": ibuId,
    };
}
