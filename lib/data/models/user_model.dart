class UserModel {
  int? id;
  String? name;
  String? email;
  String? roles;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.roles,
      this.createdAt,
      this.updatedAt,
      this.profilePhotoUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    roles = json['roles'];
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    profilePhotoUrl = json['profile_photo_url'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['roles'] = this.roles;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}
