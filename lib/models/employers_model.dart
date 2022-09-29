class EmployersModel {
  String? name;
  int? exp;
  bool? isActive;
  String? state;

  EmployersModel({this.name, this.exp, this.isActive, this.state});

  EmployersModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    exp = json['Exp'];
    isActive = json['isActive'];
    state = json['State'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Exp'] = this.exp;
    data['isActive'] = this.isActive;
    data['State'] = this.state;
    return data;
  }
}
