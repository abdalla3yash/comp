class GetUrlModel {
  String? uploadURL;
  String? key;

  GetUrlModel({this.uploadURL, this.key});

  GetUrlModel.fromJson(Map<String, dynamic> json) {
    uploadURL = json['uploadURL'];
    key = json['Key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uploadURL'] = uploadURL;
    data['Key'] = key;
    return data;
  }
}
