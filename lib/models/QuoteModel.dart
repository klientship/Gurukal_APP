// To parse this JSON data, do
//
//     final quoteModel = quoteModelFromJson(jsonString);

import 'dart:convert';

QuoteModel quoteModelFromJson(String str) =>
    QuoteModel.fromJson(json.decode(str));

String quoteModelToJson(QuoteModel data) => json.encode(data.toJson());

class QuoteModel {
  QuoteModel({
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
    this.quoteCount,
    this.quoteApprovedCount,
    this.quoteApprovedDeclined,
    this.quote,
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
  int quoteCount;
  int quoteApprovedCount;
  int quoteApprovedDeclined;
  List<Quote> quote;

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
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
        quoteCount: json["quote_count"],
        quoteApprovedCount: json["quote_approved_count"],
        quoteApprovedDeclined: json["quote_approved_declined"],
        quote: List<Quote>.from(json["quote"].map((x) => Quote.fromJson(x))),
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
        "quote_count": quoteCount,
        "quote_approved_count": quoteApprovedCount,
        "quote_approved_declined": quoteApprovedDeclined,
        "quote": List<dynamic>.from(quote.map((x) => x.toJson())),
      };
}

class Quote {
  Quote({
    this.id,
    this.customerId,
    this.quotationNo,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.from,
    this.to,
    this.list,
  });

  int id;
  int customerId;
  String quotationNo;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String from;
  String to;
  List<ListElement> list;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        id: json["id"],
        customerId: json["customer_id"],
        quotationNo: json["quotation_no"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        from: json["from"],
        to: json["to"],
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
        "from": from,
        "to": to,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
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
  String size;
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
