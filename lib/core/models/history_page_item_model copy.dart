/// this is the model calss to show items of home screen card

class HistoryPageItemModel {
  HistoryPageItemModel({
    required this.assigneeName,
    required this.createdTime,
    required this.delivaryMode,
    required this.invoiceDate,
    required this.invoiceNumber,
    required this.price,
    required this.status,
    required this.vatPrice,
  });

  String invoiceNumber;
  String invoiceDate;
  String createdTime;
  String price;
  String vatPrice;
  String delivaryMode;
  String assigneeName;
  String status;
}
