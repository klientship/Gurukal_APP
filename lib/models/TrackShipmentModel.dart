// To parse this JSON data, do
//
//     final trackShipmentModel = trackShipmentModelFromJson(jsonString);

import 'dart:convert';

TrackShipmentModel trackShipmentModelFromJson(String str) =>
    TrackShipmentModel.fromJson(json.decode(str));

String trackShipmentModelToJson(TrackShipmentModel data) =>
    json.encode(data.toJson());

class TrackShipmentModel {
  TrackShipmentModel({
    this.id,
    this.deliveryAddress,
    this.packageContactPerson,
    this.packageContactPersonPhone,
    this.packageTransactionType,
    this.packagePickupAddress,
    this.transportCompanyName,
    this.transportCompanyPhone,
    this.transportDriverName,
    this.transportDriverPhone,
    this.transportDriverVehicle,
    this.userNotes,
    this.freightInvoiceNumber,
    this.chargeTransportation,
    this.chargeHandling,
    this.chargeHalting,
    this.chargeInsurance,
    this.chargeOdc,
    this.chargeTaxPercent,
    this.chargeTaxAmount,
    this.chargeTotal,
    this.chargeAdvancePaid,
    this.chargeBalance,
    this.remarks,
    this.document,
    this.billTo,
    this.docketNo,
    this.date,
    this.senderId,
    this.receiverId,
    this.billToId,
    this.createdAt,
    this.updatedAt,
    this.vendor,
    this.paymentType,
    this.tdsAmount,
    this.discount,
    this.track,
  });

  int id;
  String deliveryAddress;
  dynamic packageContactPerson;
  dynamic packageContactPersonPhone;
  dynamic packageTransactionType;
  dynamic packagePickupAddress;
  dynamic transportCompanyName;
  dynamic transportCompanyPhone;
  dynamic transportDriverName;
  dynamic transportDriverPhone;
  dynamic transportDriverVehicle;
  dynamic userNotes;
  String freightInvoiceNumber;
  String chargeTransportation;
  String chargeHandling;
  String chargeHalting;
  String chargeInsurance;
  String chargeOdc;
  String chargeTaxPercent;
  String chargeTaxAmount;
  String chargeTotal;
  String chargeAdvancePaid;
  String chargeBalance;
  dynamic remarks;
  dynamic document;
  String billTo;
  String docketNo;
  DateTime date;
  int senderId;
  int receiverId;
  int billToId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic vendor;
  dynamic paymentType;
  String tdsAmount;
  String discount;
  List<Track> track;

  factory TrackShipmentModel.fromJson(Map<String, dynamic> json) =>
      TrackShipmentModel(
        id: json["id"],
        deliveryAddress: json["delivery_address"],
        packageContactPerson: json["package_contact_person"],
        packageContactPersonPhone: json["package_contact_person_phone"],
        packageTransactionType: json["package_transaction_type"],
        packagePickupAddress: json["package_pickup_address"],
        transportCompanyName: json["transport_company_name"],
        transportCompanyPhone: json["transport_company_phone"],
        transportDriverName: json["transport_driver_name"],
        transportDriverPhone: json["transport_driver_phone"],
        transportDriverVehicle: json["transport_driver_vehicle"],
        userNotes: json["user_notes"],
        freightInvoiceNumber: json["freight_invoice_number"],
        chargeTransportation: json["charge_transportation"],
        chargeHandling: json["charge_handling"],
        chargeHalting: json["charge_halting"],
        chargeInsurance: json["charge_Insurance"],
        chargeOdc: json["charge_odc"],
        chargeTaxPercent: json["charge_tax_percent"],
        chargeTaxAmount: json["charge_tax_amount"],
        chargeTotal: json["charge_total"],
        chargeAdvancePaid: json["charge_advance_paid"],
        chargeBalance: json["charge_balance"],
        remarks: json["remarks"],
        document: json["document"],
        billTo: json["bill_to"],
        docketNo: json["docket_no"],
        date: DateTime.parse(json["date"]),
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        billToId: json["bill_to_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        vendor: json["vendor"],
        paymentType: json["payment_type"],
        tdsAmount: json["tds_amount"],
        discount: json["discount"],
        track: List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "delivery_address": deliveryAddress,
        "package_contact_person": packageContactPerson,
        "package_contact_person_phone": packageContactPersonPhone,
        "package_transaction_type": packageTransactionType,
        "package_pickup_address": packagePickupAddress,
        "transport_company_name": transportCompanyName,
        "transport_company_phone": transportCompanyPhone,
        "transport_driver_name": transportDriverName,
        "transport_driver_phone": transportDriverPhone,
        "transport_driver_vehicle": transportDriverVehicle,
        "user_notes": userNotes,
        "freight_invoice_number": freightInvoiceNumber,
        "charge_transportation": chargeTransportation,
        "charge_handling": chargeHandling,
        "charge_halting": chargeHalting,
        "charge_Insurance": chargeInsurance,
        "charge_odc": chargeOdc,
        "charge_tax_percent": chargeTaxPercent,
        "charge_tax_amount": chargeTaxAmount,
        "charge_total": chargeTotal,
        "charge_advance_paid": chargeAdvancePaid,
        "charge_balance": chargeBalance,
        "remarks": remarks,
        "document": document,
        "bill_to": billTo,
        "docket_no": docketNo,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "sender_id": senderId,
        "receiver_id": receiverId,
        "bill_to_id": billToId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "vendor": vendor,
        "payment_type": paymentType,
        "tds_amount": tdsAmount,
        "discount": discount,
        "track": List<dynamic>.from(track.map((x) => x.toJson())),
      };
}

class Track {
  Track({
    this.id,
    this.status,
    this.location,
    this.receiverName,
    this.phone,
    this.document,
    this.createdAt,
    this.updatedAt,
    this.customerId,
    this.shipmentId,
  });

  int id;
  String status;
  dynamic location;
  dynamic receiverName;
  dynamic phone;
  dynamic document;
  DateTime createdAt;
  DateTime updatedAt;
  int customerId;
  int shipmentId;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        id: json["id"],
        status: json["status"],
        location: json["location"],
        receiverName: json["receiver_name"],
        phone: json["phone"],
        document: json["document"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        customerId: json["customer_id"],
        shipmentId: json["shipment_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "location": location,
        "receiver_name": receiverName,
        "phone": phone,
        "document": document,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "customer_id": customerId,
        "shipment_id": shipmentId,
      };
}
