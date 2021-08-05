import 'dart:convert';

InvoiceModel invoiceModelFromJson(String str) =>
    InvoiceModel.fromJson(json.decode(str));

String invoiceModelToJson(InvoiceModel data) => json.encode(data.toJson());

class InvoiceModel {
  InvoiceModel({
    this.data,
  });

  Data data;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.advancePaid,
    this.paidInvoice,
    this.outstandingInvoice,
    this.totalInvoice,
    this.shipment,
  });

  int advancePaid;
  int paidInvoice;
  int outstandingInvoice;
  int totalInvoice;
  List<Shipment> shipment;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        advancePaid: json["advance_paid"],
        paidInvoice: json["paid_invoice"],
        outstandingInvoice: json["outstanding_invoice"],
        totalInvoice: json["total_invoice"],
        shipment: List<Shipment>.from(
            json["shipment"].map((x) => Shipment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "advance_paid": advancePaid,
        "paid_invoice": paidInvoice,
        "outstanding_invoice": outstandingInvoice,
        "total_invoice": totalInvoice,
        "shipment": List<dynamic>.from(shipment.map((x) => x.toJson())),
      };
}

class Shipment {
  Shipment({
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
    this.totalPaid,
    this.shipmentStatus,
    this.paymentStatus,
    this.senderName,
    this.payment,
    this.status,
    this.sender,
  });

  int id;
  String deliveryAddress;
  dynamic packageContactPerson;
  dynamic packageContactPersonPhone;
  String packageTransactionType;
  String packagePickupAddress;
  String transportCompanyName;
  dynamic transportCompanyPhone;
  String transportDriverName;
  String transportDriverPhone;
  String transportDriverVehicle;
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
  int totalPaid;
  Status shipmentStatus;
  String paymentStatus;
  String senderName;
  List<Payment> payment;
  Status status;
  Sender sender;

  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
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
        totalPaid: json["total_paid"],
        shipmentStatus: Status.fromJson(json["shipment_status"]),
        paymentStatus: json["payment_status"],
        senderName: json["sender_name"],
        payment:
            List<Payment>.from(json["payment"].map((x) => Payment.fromJson(x))),
        status: Status.fromJson(json["status"]),
        sender: Sender.fromJson(json["sender"]),
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
        "total_paid": totalPaid,
        "shipment_status": shipmentStatus.toJson(),
        "payment_status": paymentStatus,
        "sender_name": senderName,
        "payment": List<dynamic>.from(payment.map((x) => x.toJson())),
        "status": status.toJson(),
        "sender": sender.toJson(),
      };
}

class Payment {
  Payment({
    this.id,
    this.paymentType,
    this.amount,
    this.paymentDate,
    this.bankName,
    this.upiRefId,
    this.chequeNo,
    this.shipmentId,
    this.customerId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String paymentType;
  String amount;
  DateTime paymentDate;
  dynamic bankName;
  dynamic upiRefId;
  dynamic chequeNo;
  int shipmentId;
  int customerId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        paymentType: json["payment_type"],
        amount: json["amount"],
        paymentDate: DateTime.parse(json["payment_date"]),
        bankName: json["bank_name"],
        upiRefId: json["upi_ref_id"],
        chequeNo: json["cheque_no"],
        shipmentId: json["shipment_id"],
        customerId: json["customer_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_type": paymentType,
        "amount": amount,
        "payment_date":
            "${paymentDate.year.toString().padLeft(4, '0')}-${paymentDate.month.toString().padLeft(2, '0')}-${paymentDate.day.toString().padLeft(2, '0')}",
        "bank_name": bankName,
        "upi_ref_id": upiRefId,
        "cheque_no": chequeNo,
        "shipment_id": shipmentId,
        "customer_id": customerId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Sender {
  Sender({
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

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
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

class Status {
  Status({
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
  String location;
  String receiverName;
  dynamic phone;
  dynamic document;
  DateTime createdAt;
  DateTime updatedAt;
  int customerId;
  int shipmentId;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
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
