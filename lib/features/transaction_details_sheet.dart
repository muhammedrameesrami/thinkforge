import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thinkforege/core/constants/imageconst.dart';
import '../core/constants/colorConst.dart';
import 'transaction_model.dart';
import 'transfer_step_3_sheet.dart';

class TransactionDetailsSheet extends StatelessWidget {
  final TransactionItem transaction;

  const TransactionDetailsSheet({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    bool isTablet = w > 600;

    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.2), // Subtle dim
            ),
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: isTablet ? 0.6 : 0.85,
          minChildSize: 0.5,
          maxChildSize: isTablet ? 0.7 : 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1E1E1E), // Slightly lighter black for sheet
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  // Grabber

                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          // SUCCESS ICON
                          Image.asset(
                            ImageConst.verified,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            transaction.title,
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorConst.white,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // DETAILS CARD
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF111827), // Dark card
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                if (transaction.to != null)
                                  _detailRow("To", transaction.to!),
                                if (transaction.to != null)
                                  const Divider(color: Colors.white10),
                                if (transaction.from != null)
                                  _detailRow("From", transaction.from!),
                                if (transaction.from != null)
                                  const Divider(color: Colors.white10),
                                if (transaction.txnId != null)
                                  _detailRow("Txn Id", transaction.txnId!),
                                if (transaction.txnId != null)
                                  const Divider(color: Colors.white10),
                                if (transaction.note != null)
                                  _detailRow("Note", transaction.note!),
                                if (transaction.note != null)
                                  const Divider(color: Colors.white10),
                                _detailRow(
                                    "Status",
                                    transaction.status ??
                                        (transaction.isApproved
                                            ? "Completed"
                                            : "Failed"),
                                    valueColor: transaction.isApproved
                                        ? Colors.white
                                        : Colors.redAccent),
                                const Divider(color: Colors.white10),
                                _detailRow("Time and Date",
                                    transaction.dateTime ?? transaction.date),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Total",
                                style:
                                    GoogleFonts.inter(color: ColorConst.grey)),
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              transaction.amount,
                              style: GoogleFonts.inter(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: ColorConst.white,
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Assuming we want to close current and open next, OR stack it.
                                // "Stacking" is usually better for "Step" flows.
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors
                                      .transparent, // Allow blur to show through
                                  builder: (context) =>
                                      const TransferStep3Sheet(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConst.white,
                                foregroundColor: ColorConst.black,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                "Continue",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _detailRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: ColorConst.grey,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: GoogleFonts.inter(
                color: valueColor ?? ColorConst.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
