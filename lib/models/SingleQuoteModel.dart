// To parse this JSON data, do
//
//     final singleQuoteModel = singleQuoteModelFromJson(jsonString);

import 'dart:convert';

SingleQuoteModel singleQuoteModelFromJson(String str) =>
    SingleQuoteModel.fromJson(json.decode(str));

String singleQuoteModelToJson(SingleQuoteModel data) =>
    json.encode(data.toJson());

class SingleQuoteModel {
  SingleQuoteModel({
    this.id,
    this.customerId,
    this.quotationNo,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.customer,
    this.list,
  });

  int id;
  int customerId;
  String quotationNo;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Customer customer;
  List<ListElement> list;

  factory SingleQuoteModel.fromJson(Map<String, dynamic> json) =>
      SingleQuoteModel(
        id: json["id"],
        customerId: json["customer_id"],
        quotationNo: json["quotation_no"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        customer: Customer.fromJson(json["customer"]),
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "quotation_no": quotationNo,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "customer": customer.toJson(),
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class Customer {
  Customer({
    this.id,
    this.name,
    this.email,
    this.role,
    this.companyName,
    this.gst,
    this.phone,
    this.address,
    this.userNotes,
    this.status,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.showRates,
  });

  int id;
  String name;
  String email;
  String role;
  String companyName;
  String gst;
  String phone;
  String address;
  dynamic userNotes;
  int status;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int showRates;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        companyName: json["company_name"],
        gst: json["gst"],
        phone: json["phone"],
        address: json["address"],
        userNotes: json["user_notes"],
        status: json["status"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        showRates: json["show_rates"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "company_name": companyName,
        "gst": gst,
        "phone": phone,
        "address": address,
        "user_notes": userNotes,
        "status": status,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "show_rates": showRates,
      };
}

class ListElement {
  ListElement({
    this.id,
    this.from,
    this.to,
    this.description,
    this.size,
    this.weight,
    this.eta,
    this.rate,
    this.advance,
    this.quoteId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String from;
  String to;
  String description;
  dynamic size;
  String weight;
  String eta;
  String rate;
  String advance;
  int quoteId;
  DateTime createdAt;
  DateTime updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        from: json["from"],
        to: json["to"],
        description: json["description"],
        size: json["size"],
        weight: json["weight"],
        eta: json["eta"],
        rate: json["rate"],
        advance: json["advance"],
        quoteId: json["quote_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "from": from,
        "to": to,
        "description": description,
        "size": size,
        "weight": weight,
        "eta": eta,
        "rate": rate,
        "advance": advance,
        "quote_id": quoteId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
