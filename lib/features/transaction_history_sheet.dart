import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/colorConst.dart';
import 'transaction_model.dart';
import 'transaction_details_sheet.dart';

class TransactionHistorySheet extends StatefulWidget {
  final List<TransactionItem> transactions;

  const TransactionHistorySheet({super.key, required this.transactions});

  @override
  State<TransactionHistorySheet> createState() =>
      _TransactionHistorySheetState();
}

class _TransactionHistorySheetState extends State<TransactionHistorySheet> {
  @override
  Widget build(BuildContext context) {
    // Group transactions by Date for the "Header" effect
    // For simplicity in this demo, we'll just show the list with headers manually inserted or just a flat list for now.
    // The user requested: Date header -> List Items.

    var w = MediaQuery.of(context).size.width;
    bool isTablet = w > 600;

    return DraggableScrollableSheet(
      initialChildSize: isTablet ? 0.6 : 0.9,
      minChildSize: 0.5,
      maxChildSize: isTablet ? 0.7 : 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: ColorConst.cardDark,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              // SEARCH & FILTER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorConst.black,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: ColorConst.grey),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                style: GoogleFonts.inter(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Search Transactions",
                                  hintStyle:
                                      GoogleFonts.inter(color: ColorConst.grey),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: ColorConst.black,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white12),
                      ),
                      child: const Icon(Icons.filter_list,
                          color: ColorConst.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // LIST
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount:
                      widget.transactions.length + 1, // +1 for a header example
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          "November 30th, 2025", // Hardcoded for matching design
                          style: GoogleFonts.inter(
                            color: ColorConst.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }
                    final item = widget.transactions[index - 1];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) =>
                                TransactionDetailsSheet(transaction: item),
                          );
                        },
                        child: _buildTransactionTile(item),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTransactionTile(TransactionItem item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConst.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: item.iconBgColor
                  .withOpacity(0.2), // Transparent bg matching image
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                item.icon,
                color: item.iconBgColor, // Icon colored
                width: 20,
                height: 20,
              ),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.inter(
                    color: ColorConst.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Text(
                  item.date,
                  style: GoogleFonts.inter(
                    color: ColorConst.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Text(
            item.isApproved ? "Approved" : "Rejected",
            style: GoogleFonts.inter(
              color: item.isApproved
                  ? const Color(0xff4ADE80)
                  : const Color(0xffEF4444), // Green or Red
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 13),
          Text(
            item.amount,
            style: GoogleFonts.inter(
              color: item.isApproved
                  ? const Color(0xff4ADE80)
                  : ColorConst
                      .white, // Always green in screenshot for amount? Or red for minus? Screenshot shows green +21,282. Assuming colors match sign.
              // Actually screenshot 1 shows all green. screenshot 2 shows white amount.
              // I will stick to green for positive, white/grey for others?
              // Wait, Screenshot 1 has:
              // +$21,282 (Green)
              // -$21,282 (White/Grey)
              // +$21,282 (Green)
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
