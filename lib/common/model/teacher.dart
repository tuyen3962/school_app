class Teacher {
  String? sId;
  String? teacherId;
  String? fullName;
  String? teacherCode;
  String? email;
  String? password;
  String? phoneNumber;
  String? gender;
  String? cccd;
  String? birthDate;
  String? birthPlace;
  String? ethnicity;
  String? nickname;
  String? teachingLevel;
  String? position;
  String? experience;
  String? department;
  String? role;
  String? joinDate;
  bool? civilServant;
  String? contractType;
  String? primarySubject;
  String? secondarySubject;
  bool? isWorking;
  String? academicDegree;
  String? standardDegree;
  String? politicalTheory;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? avatarUrl;

  Teacher(
      {this.sId,
      this.teacherId,
      this.fullName,
      this.teacherCode,
      this.email,
      this.password,
      this.phoneNumber,
      this.gender,
      this.cccd,
      this.birthDate,
      this.birthPlace,
      this.ethnicity,
      this.nickname,
      this.teachingLevel,
      this.position,
      this.experience,
      this.department,
      this.role,
      this.joinDate,
      this.civilServant,
      this.contractType,
      this.primarySubject,
      this.secondarySubject,
      this.isWorking,
      this.academicDegree,
      this.standardDegree,
      this.politicalTheory,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.avatarUrl});

  Teacher.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    teacherId = json['teacherId'];
    fullName = json['fullName'];
    teacherCode = json['teacherCode'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    cccd = json['cccd'];
    birthDate = json['birthDate'];
    birthPlace = json['birthPlace'];
    ethnicity = json['ethnicity'];
    nickname = json['nickname'];
    teachingLevel = json['teachingLevel'];
    position = json['position'];
    experience = json['experience'];
    department = json['department'];
    role = json['role'];
    joinDate = json['joinDate'];
    civilServant = json['civilServant'];
    contractType = json['contractType'];
    primarySubject = json['primarySubject'];
    secondarySubject = json['secondarySubject'];
    isWorking = json['isWorking'];
    academicDegree = json['academicDegree'];
    standardDegree = json['standardDegree'];
    politicalTheory = json['politicalTheory'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    avatarUrl = json['avatarUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['teacherId'] = this.teacherId;
    data['fullName'] = this.fullName;
    data['teacherCode'] = this.teacherCode;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['cccd'] = this.cccd;
    data['birthDate'] = this.birthDate;
    data['birthPlace'] = this.birthPlace;
    data['ethnicity'] = this.ethnicity;
    data['nickname'] = this.nickname;
    data['teachingLevel'] = this.teachingLevel;
    data['position'] = this.position;
    data['experience'] = this.experience;
    data['department'] = this.department;
    data['role'] = this.role;
    data['joinDate'] = this.joinDate;
    data['civilServant'] = this.civilServant;
    data['contractType'] = this.contractType;
    data['primarySubject'] = this.primarySubject;
    data['secondarySubject'] = this.secondarySubject;
    data['isWorking'] = this.isWorking;
    data['academicDegree'] = this.academicDegree;
    data['standardDegree'] = this.standardDegree;
    data['politicalTheory'] = this.politicalTheory;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['avatarUrl'] = this.avatarUrl;
    return data;
  }
}
