import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  DashboardModel({
    this.totalShipments,
    this.deliveredShipments,
    this.pendingShipments,
  });

  int totalShipments;
  int deliveredShipments;
  int pendingShipments;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        totalShipments: json["total_shipments"],
        deliveredShipments: json["delivered_shipments"],
        pendingShipments: json["pending_shipments"],
      );

  Map<String, dynamic> toJson() => {
        "total_shipments": totalShipments,
        "delivered_shipments": deliveredShipments,
        "pending_shipments": pendingShipments,
      };
}
