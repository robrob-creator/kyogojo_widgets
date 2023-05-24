import 'dart:convert';

RequestModel requestModelFromJson(String str) =>
    RequestModel.fromJson(json.decode(str));
String requestModelToJson(RequestModel data) => json.encode(data.toJson());

class RequestModel {
  RequestModel(
      {required this.requestType,
      required this.formType,
      required this.form,
      required this.requestBy,
      this.status,
      this.logs,
      this.id,
      this.soa,
      this.total,
      this.meterNumber,
      this.schedule,
      this.customerStatusHistory,
      this.requirements});

  String? id;
  String requestType;
  String formType;
  String? status;
  String? meterNumber;
  Form form;
  List<Requirement>? requirements;
  RequestBy requestBy;
  List<Log>? logs;
  List<Soa>? soa;
  int? total;
  String? schedule;
  List<CustomerStatusHistory>? customerStatusHistory;

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        id: json["id"] ?? '',
        requestType: json["requestType"] ?? '',
        schedule: json["schedule"] ?? DateTime.now().toIso8601String(),
        formType: json["formType"] ?? '',
        status: json["status"] ?? '',
        meterNumber: json["meterNumber"] ?? '',
        form: Form.fromJson(json["form"]),
        requestBy: RequestBy.fromJson(json["requestBy"]),
        logs: List<Log>.from(json["logs"].map((x) => Log.fromJson(x))),
        requirements: List<Requirement>.from(
            json["requirements"].map((x) => Requirement.fromJson(x))),
        soa: List<Soa>.from(json["soa"].map((x) => Soa.fromJson(x))),
        total: json["total"] ?? 0,
        customerStatusHistory: List<CustomerStatusHistory>.from(
            json["customerStatusHistory"]
                .map((x) => CustomerStatusHistory.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "requestType": requestType,
        "formType": formType,
        "status": status,
        "form": form.toJson(),
        "requestBy": requestBy.toJson(),
        "logs": logs != null
            ? List<dynamic>.from(logs!.map((x) => x.toJson()))
            : [],
        "requirements":
            List<dynamic>.from(requirements?.map((x) => x.toJson()) ?? []),
        "soa": List<dynamic>.from(soa?.map((x) => x.toJson()) ?? []),
        "total": total ?? 0,
        "schedule": schedule ?? DateTime.now().toIso8601String(),
        "meterNumber": meterNumber ?? "",
        "customerStatusHistory": List<dynamic>.from(
            customerStatusHistory?.map((x) => x.toJson()) ?? []),
      };
}

class Form {
  Form(
      {required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.suffix,
      this.phoneNumber,
      this.birthdate,
      this.age,
      this.addressList,
      this.monthlyIncome,
      this.installationAddress,
      this.connectionType});
  String firstName;
  String lastName;
  String middleName;
  String? suffix;
  String? phoneNumber;

  String? birthdate;
  String? age;
  String? monthlyIncome;
  String? connectionType;
  Address? installationAddress;
  List<Address>? addressList;
  factory Form.fromJson(Map<String, dynamic> json) => Form(
        firstName: json["firstName"] ?? '',
        lastName: json["lastName"] ?? '',
        middleName: json["middleName"] ?? '',
        suffix: json["suffix"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        birthdate: json["birthdate"] ?? '',
        age: json["age"] ?? '',
        monthlyIncome: json["monthlyIncome"] ?? '',
        connectionType: json["connectionType"] ?? '',
        installationAddress: Address.fromJson(json["installationAddress"]),
        addressList: List<Address>.from(
            json["addressList"].map((x) => Address.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "suffix": suffix,
        "phoneNumber": phoneNumber,
        "birthdate": birthdate,
        "age": age,
        "monthlyIncome": monthlyIncome,
        "connectionType": connectionType,
        "installationAddress": installationAddress?.toJson(),
        "addressList": addressList != null
            ? List<dynamic>.from(addressList!.map((x) => x.toJson()))
            : [],
      };
}

class RequestBy {
  RequestBy({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.mobileNumber,
    required this.type,
  });
  String id;
  String email;
  String firstName;
  String lastName;
  String middleName;
  String mobileNumber;
  String type;
  factory RequestBy.fromJson(Map<String, dynamic> json) => RequestBy(
        id: json["id"] ?? '',
        email: json["email"] ?? '',
        firstName: json["firstName"] ?? '',
        lastName: json["lastName"],
        middleName: json["middleName"] ?? '',
        mobileNumber: json["mobileNumber"] ?? '',
        type: json["type"] ?? '',
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "mobileNumber": mobileNumber,
        "type": type,
      };
}

class Log {
  Log({
    required this.userId,
    required this.action,
    required this.status,
    this.remarks,
    required this.date,
  });
  String userId;
  String action;
  String status;
  dynamic remarks;
  DateTime date;
  factory Log.fromJson(Map<String, dynamic> json) => Log(
        userId: json["userId"],
        action: json["action"],
        status: json["status"],
        remarks: json["remarks"],
        date: DateTime.parse(json["date"]),
      );
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "action": action,
        "status": status,
        "remarks": remarks,
        "date": date.toIso8601String(),
      };
}

class Address {
  Address(
      {this.longitude,
      this.latitude,
      this.description,
      this.province,
      this.city,
      this.region,
      this.barangay,
      this.street,
      this.landmark});
  double? longitude;
  double? latitude;
  String? description;
  String? region;
  String? province;
  String? city;
  String? barangay;
  String? street;
  String? landmark;
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        description: json["description"],
        province: json["province"],
        city: json["city"],
        region: json["region"],
        barangay: json["barangay"],
        street: json["street"],
        landmark: json["landmark"],
      );
  Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
        "description": description,
        "region": region,
        "province": province,
        "city": city,
        "barangay": barangay,
        "street": street,
        "landmark": landmark
      };
}

class Requirement {
  Requirement({
    this.name,
    this.description,
    this.attachments,
  });

  String? name;
  String? description;
  List<String>? attachments;

  factory Requirement.fromRawJson(String str) =>
      Requirement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Requirement.fromJson(Map<String, dynamic> json) => Requirement(
        name: json["name"],
        description: json["description"],
        attachments: List<String>.from(json["attachments"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "attachments": List<dynamic>.from(attachments?.map((x) => x) ?? []),
      };
}

class Soa {
  Soa({
    this.particular,
    this.amount,
  });

  String? particular;
  int? amount;

  factory Soa.fromRawJson(String str) => Soa.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Soa.fromJson(Map<String, dynamic> json) => Soa(
        particular: json["particular"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "particular": particular,
        "amount": amount,
      };
}

class CustomerStatusHistory {
  CustomerStatusHistory({
    this.status,
    this.checked,
    this.date,
  });

  String? status;
  bool? checked;
  DateTime? date;

  factory CustomerStatusHistory.fromRawJson(String str) =>
      CustomerStatusHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerStatusHistory.fromJson(Map<String, dynamic> json) =>
      CustomerStatusHistory(
        status: json["status"],
        checked: json["checked"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "checked": checked,
        "date": date?.toIso8601String(),
      };
}
