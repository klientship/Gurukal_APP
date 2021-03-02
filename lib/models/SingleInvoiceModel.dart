// To parse this JSON data, do
//
//     final singleInvoiceModel = singleInvoiceModelFromJson(jsonString);

import 'dart:convert';

SingleInvoiceModel singleInvoiceModelFromJson(String str) =>
    SingleInvoiceModel.fromJson(json.decode(str));

String singleInvoiceModelToJson(SingleInvoiceModel data) =>
    json.encode(data.toJson());

class SingleInvoiceModel {
  SingleInvoiceModel({
    this.data,
  });

  Data data;

  factory SingleInvoiceModel.fromJson(Map<String, dynamic> json) =>
      SingleInvoiceModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.billTo,
    this.billToId,
    this.docketNo,
    this.chargeInsurance,
    this.chargeAdvancePaid,
    this.chargeBalance,
    this.chargeHalting,
    this.chargeHandling,
    this.chargeOdc,
    this.chargeTaxAmount,
    this.chargeTaxPercent,
    this.chargeTotal,
    this.balance,
    this.discount,
    this.chargeTransportation,
    this.createdAt,
    this.date,
    this.deliveryAddress,
    this.freightInvoiceNumber,
    this.insurance,
    this.package,
    this.packageContactPerson,
    this.packagePickupAddress,
    this.packageTransactionType,
    this.payment,
    this.paymentType,
    this.receiver,
    this.receiverId,
    this.remarks,
    this.sender,
    this.senderId,
    this.transportCompanyName,
    this.transportCompanyPhone,
    this.transportDriverName,
    this.transportDriverPhone,
    this.transportDriverVehicle,
    this.userNotes,
    this.vendorId,
    this.vendorTotal,
    this.vendorAdvance,
    this.vendorCommission,
    this.vendorName,
    this.vendorBalance,
    this.tdsAmount,
    this.document,
    this.updatedAt,
  });

  int id;
  String billTo;
  int billToId;
  String docketNo;
  String chargeInsurance;
  String chargeAdvancePaid;
  String chargeBalance;
  String chargeHalting;
  String chargeHandling;
  String chargeOdc;
  String chargeTaxAmount;
  String chargeTaxPercent;
  String chargeTotal;
  int balance;
  String discount;
  String chargeTransportation;
  DateTime createdAt;
  DateTime date;
  String deliveryAddress;
  String freightInvoiceNumber;
  List<dynamic> insurance;
  List<Package> package;
  dynamic packageContactPerson;
  dynamic packagePickupAddress;
  String packageTransactionType;
  List<dynamic> payment;
  dynamic paymentType;
  Receiver receiver;
  int receiverId;
  dynamic remarks;
  Receiver sender;
  int senderId;
  dynamic transportCompanyName;
  dynamic transportCompanyPhone;
  dynamic transportDriverName;
  dynamic transportDriverPhone;
  dynamic transportDriverVehicle;
  dynamic userNotes;
  int vendorId;
  int vendorTotal;
  int vendorAdvance;
  String vendorCommission;
  String vendorName;
  int vendorBalance;
  String tdsAmount;
  dynamic document;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        billTo: json["bill_to"],
        billToId: json["bill_to_id"],
        docketNo: json["docket_no"],
        chargeInsurance: json["charge_Insurance"],
        chargeAdvancePaid: json["charge_advance_paid"],
        chargeBalance: json["charge_balance"],
        chargeHalting: json["charge_halting"],
        chargeHandling: json["charge_handling"],
        chargeOdc: json["charge_odc"],
        chargeTaxAmount: json["charge_tax_amount"],
        chargeTaxPercent: json["charge_tax_percent"],
        chargeTotal: json["charge_total"],
        balance: json["balance"],
        discount: json["discount"],
        chargeTransportation: json["charge_transportation"],
        createdAt: DateTime.parse(json["created_at"]),
        date: DateTime.parse(json["date"]),
        deliveryAddress: json["delivery_address"],
        freightInvoiceNumber: json["freight_invoice_number"],
        insurance: List<dynamic>.from(json["insurance"].map((x) => x)),
        package:
            List<Package>.from(json["package"].map((x) => Package.fromJson(x))),
        packageContactPerson: json["package_contact_person"],
        packagePickupAddress: json["package_pickup_address"],
        packageTransactionType: json["package_transaction_type"],
        payment: List<dynamic>.from(json["payment"].map((x) => x)),
        paymentType: json["payment_type"],
        receiver: Receiver.fromJson(json["receiver"]),
        receiverId: json["receiver_id"],
        remarks: json["remarks"],
        sender: Receiver.fromJson(json["sender"]),
        senderId: json["sender_id"],
        transportCompanyName: json["transport_company_name"],
        transportCompanyPhone: json["transport_company_phone"],
        transportDriverName: json["transport_driver_name"],
        transportDriverPhone: json["transport_driver_phone"],
        transportDriverVehicle: json["transport_driver_vehicle"],
        userNotes: json["user_notes"],
        vendorId: json["vendor_id"],
        vendorTotal: json["vendor_total"],
        vendorAdvance: json["vendor_advance"],
        vendorCommission: json["vendor_commission"],
        vendorName: json["vendor_name"],
        vendorBalance: json["vendor_balance"],
        tdsAmount: json["tds_amount"],
        document: json["document"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bill_to": billTo,
        "bill_to_id": billToId,
        "docket_no": docketNo,
        "charge_Insurance": chargeInsurance,
        "charge_advance_paid": chargeAdvancePaid,
        "charge_balance": chargeBalance,
        "charge_halting": chargeHalting,
        "charge_handling": chargeHandling,
        "charge_odc": chargeOdc,
        "charge_tax_amount": chargeTaxAmount,
        "charge_tax_percent": chargeTaxPercent,
        "charge_total": chargeTotal,
        "balance": balance,
        "discount": discount,
        "charge_transportation": chargeTransportation,
        "created_at": createdAt.toIso8601String(),
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "delivery_address": deliveryAddress,
        "freight_invoice_number": freightInvoiceNumber,
        "insurance": List<dynamic>.from(insurance.map((x) => x)),
        "package": List<dynamic>.from(package.map((x) => x.toJson())),
        "package_contact_person": packageContactPerson,
        "package_pickup_address": packagePickupAddress,
        "package_transaction_type": packageTransactionType,
        "payment": List<dynamic>.from(payment.map((x) => x)),
        "payment_type": paymentType,
        "receiver": receiver.toJson(),
        "receiver_id": receiverId,
        "remarks": remarks,
        "sender": sender.toJson(),
        "sender_id": senderId,
        "transport_company_name": transportCompanyName,
        "transport_company_phone": transportCompanyPhone,
        "transport_driver_name": transportDriverName,
        "transport_driver_phone": transportDriverPhone,
        "transport_driver_vehicle": transportDriverVehicle,
        "user_notes": userNotes,
        "vendor_id": vendorId,
        "vendor_total": vendorTotal,
        "vendor_advance": vendorAdvance,
        "vendor_commission": vendorCommission,
        "vendor_name": vendorName,
        "vendor_balance": vendorBalance,
        "tds_amount": tdsAmount,
        "document": document,
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Package {
  Package({
    this.id,
    this.description,
    this.serialNo,
    this.invoiceNo,
    this.size,
    this.weight,
    this.cost,
    this.shipmentId,
    this.createdAt,
    this.updatedAt,
    this.quantity,
  });

  int id;
  String description;
  dynamic serialNo;
  dynamic invoiceNo;
  dynamic size;
  dynamic weight;
  String cost;
  int shipmentId;
  DateTime createdAt;
  DateTime updatedAt;
  String quantity;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        description: json["description"],
        serialNo: json["serial_no"],
        invoiceNo: json["invoice_no"],
        size: json["size"],
        weight: json["weight"],
        cost: json["cost"],
        shipmentId: json["shipment_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "serial_no": serialNo,
        "invoice_no": invoiceNo,
        "size": size,
        "weight": weight,
        "cost": cost,
        "shipment_id": shipmentId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "quantity": quantity,
      };
}

class Receiver {
  Receiver({
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
  String userNotes;
  int status;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int showRates;

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        companyName: json["company_name"],
        gst: json["gst"],
        phone: json["phone"],
        address: json["address"],
        userNotes: json["user_notes"] == null ? null : json["user_notes"],
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
        "user_notes": userNotes == null ? null : userNotes,
        "status": status,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "show_rates": showRates,
      };
}
