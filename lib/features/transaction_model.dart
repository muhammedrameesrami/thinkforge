import 'package:flutter/material.dart';

class TransactionItem {
  final String title;
  final String date;
  final String amount;
  final bool isApproved;
  final Color iconBgColor;
  final String icon;
  // Details
  final String? from;
  final String? to;
  final String? txnId;
  final String? note;
  final String? status;
  final String? dateTime;

  TransactionItem({
    required this.title,
    required this.date,
    required this.amount,
    required this.isApproved,
    required this.iconBgColor,
    required this.icon,
    this.from,
    this.to,
    this.txnId,
    this.note,
    this.status,
    this.dateTime,
  });
}
