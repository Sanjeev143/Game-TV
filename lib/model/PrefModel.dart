// Created by Sanjeev Sangral on 19/09/21.
class PrefModel {
  String userEmail;
  bool isLogin;
  String preferencesModel;

  PrefModel(
      {this.userEmail,
      this.preferencesModel,
      this.isLogin,});

  factory PrefModel.fromJson(Map<String, dynamic> parsedJson) {
    return new PrefModel(
        userEmail: parsedJson['userEmail'] ?? "",
        preferencesModel: parsedJson['preferencesModel'] ?? "",
        isLogin: parsedJson['isLogin'] ?? false);
  }

  Map<String, dynamic> toJson() {
    return {
      "userEmail": this.userEmail,
      "preferencesModel": this.preferencesModel,
      "isLogin": this.isLogin,
    };
  }
}
