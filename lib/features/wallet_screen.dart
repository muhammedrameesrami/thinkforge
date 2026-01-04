import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/common/comon.dart';
import '../core/constants/colorConst.dart';
import '../core/constants/imageconst.dart';

import 'transaction_details_sheet.dart';
import 'transaction_model.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final List<TransactionItem> transactions = [
    TransactionItem(
      title: "Wallet Deposit",
      date: "23rd May 2025",
      amount: "+\$500.00",
      isApproved: true,
      iconBgColor: Colors.green,
      icon: ImageConst.wallet,
      to: 'Wallet(HDFC-346****737***737)',
      from: 'Axis Bank-423***3213***232',
      txnId: 'TXN-123456789',
      note: 'Deposit from Axis Bank',
      status: 'Completed',
      dateTime: '23rd May 2025 10:30 AM',
    ),
    TransactionItem(
      title: "Service Payment",
      date: "22nd May 2025",
      amount: "-\$120.00",
      isApproved: true,
      iconBgColor: Colors.blue,
      icon: ImageConst.wallet,
      to: 'Wallet(HDFC-346****737***737)',
      from: 'Axis Bank-423***3213***232',
      txnId: 'TXN-123456789',
      note: 'Deposit from Axis Bank',
      status: 'Completed',
      dateTime: '23rd May 2025 10:30 AM',
    ),
    TransactionItem(
      title: "Refund",
      date: "21st May 2025",
      amount: "+\$80.00",
      isApproved: false,
      iconBgColor: Colors.orange,
      icon: ImageConst.wallet,
      to: 'Wallet(HDFC-346****737***737)',
      from: 'Axis Bank-423***3213***232',
      txnId: 'TXN-123456789',
      note: 'Deposit from Axis Bank',
      status: 'Completed',
      dateTime: '23rd May 2025 10:30 AM',
    ),
    TransactionItem(
      title: "Bonus Credit",
      date: "20th May 2025",
      amount: "+\$56.89",
      isApproved: true,
      iconBgColor: Colors.purple,
      icon: ImageConst.wallet,
      to: 'Wallet(HDFC-346****737***737)',
      from: 'Axis Bank-423***3213***232',
      txnId: 'TXN-123456789',
      note: 'Deposit from Axis Bank',
      status: 'Completed',
      dateTime: '23rd May 2025 10:30 AM',
    ),
    TransactionItem(
      title: "Withdrawal",
      date: "19th May 2025",
      amount: "-\$300.00",
      isApproved: false,
      iconBgColor: Colors.red,
      icon: ImageConst.wallet,
      to: 'Wallet(HDFC-346****737***737)',
      from: 'Axis Bank-423***3213***232',
      txnId: 'TXN-123456789',
      note: 'Deposit from Axis Bank',
      status: 'Completed',
      dateTime: '23rd May 2025 10:30 AM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.appBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 16),
              child: _topBar(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      // Balance Section (Dark, Rounded)
                      _balanceSection(),
                      const SizedBox(height: 24),
                      _actionButtons(),
                      const SizedBox(height: 24),
                      _transactionOverview(),
                      const SizedBox(height: 24),
                      _transactionTile(context),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(ImageConst.avatar),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Image.asset(ImageConst.logo, height: 30),
          Container(
            height: 45,
            width: 45,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorConst.cardDark,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(ImageConst.notification, height: 20, width: 20),
          )
        ],
      ),
    );
  }

  Widget _balanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Balance",
          style: GoogleFonts.inter(color: ColorConst.grey, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          "\$ 5,231.89",
          style: GoogleFonts.inter(
            color: ColorConst.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Unassigned amount wallet :\$345.09 ",
          style: GoogleFonts.inter(color: ColorConst.grey, fontSize: 14),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget _actionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Image.asset(
              ImageConst.depositIcon,
              color: Colors.black,
              height: 20,
            ),
            label: Text(
              "Deposit",
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.white,
              foregroundColor: ColorConst.black,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Image.asset(
              ImageConst.hand,
              color: Colors.white,
              height: 20,
            ),
            label: Text(
              "Withdraw",
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.cardDark,
              foregroundColor: ColorConst.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Image.asset(
              ImageConst.support,
              color: Colors.white,
              height: 20,
            ),
            label: Text(
              "Transfer",
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.cardDark,
              foregroundColor: ColorConst.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _transactionOverview() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    bool isTablet = w > 600;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorConst.cardDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My MT5 Accounts ...",
            style: GoogleFonts.inter(
              color: ColorConst.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: w * 0.38,
                height: isTablet ? h * 0.22 : h * 0.12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: ColorConst.grey, width: w * 0.003)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" Demo",
                        style: GoogleFonts.inter(
                            color: ColorConst.grey, fontSize: 12)),
                    const SizedBox(height: 6),
                    Text(" MT5i92",
                        style: GoogleFonts.inter(
                            color: const Color(0xFFC084FC), fontSize: 12)),
                    const SizedBox(height: 6),
                    Text(
                      " +\$5,325.57",
                      style: GoogleFonts.inter(
                        color: ColorConst.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: w * 0.03,
              ),
              Container(
                width: w * 0.38,
                height: isTablet ? h * 0.22 : h * 0.12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: ColorConst.grey, width: w * 0.003)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(" Live",
                            style: GoogleFonts.inter(
                                color: ColorConst.grey, fontSize: 12)),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: w * 0.01,
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(" MT5i92",
                        style: GoogleFonts.inter(
                            color: const Color(0xFFC084FC), fontSize: 12)),
                    const SizedBox(height: 6),
                    Text(
                      " +\$5,325.57",
                      style: GoogleFonts.inter(
                        color: ColorConst.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "My Bank Accounts ...",
            style: GoogleFonts.inter(
              color: ColorConst.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: isTablet ? w * 0.35 : w * 0.45,
                  height: isTablet ? h * 0.3 : h * 0.14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade400,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(" AXIS BANK",
                              style: GoogleFonts.inter(
                                  color: Colors.white, fontSize: 12)),
                          const Icon(
                            Icons.more_vert_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        " 54322****34343",
                        style: GoogleFonts.inter(
                          color: ColorConst.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(
                          " India",
                          style: GoogleFonts.inter(
                            color: ColorConst.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          " Pending",
                          style: GoogleFonts.inter(
                            color: ColorConst.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: w * 0.05,
                ),
                Container(
                  width: isTablet ? w * 0.35 : w * 0.45,
                  height: isTablet ? h * 0.3 : h * 0.14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.shade400,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(" ICIC ",
                              style: GoogleFonts.inter(
                                  color: Colors.white, fontSize: 12)),
                          const Icon(
                            Icons.more_vert_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        " 54322****34343",
                        style: GoogleFonts.inter(
                          color: ColorConst.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(
                          " India",
                          style: GoogleFonts.inter(
                            color: ColorConst.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          " Pending",
                          style: GoogleFonts.inter(
                            color: ColorConst.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: w * 0.05,
                ),
                Container(
                  width: isTablet ? w * 0.35 : w * 0.45,
                  height: isTablet ? h * 0.3 : h * 0.14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple.shade400,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(" ICIC ",
                              style: GoogleFonts.inter(
                                  color: Colors.white, fontSize: 12)),
                          const Icon(
                            Icons.more_vert_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        " 54322****34343",
                        style: GoogleFonts.inter(
                          color: ColorConst.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(
                          " India",
                          style: GoogleFonts.inter(
                            color: ColorConst.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          " Pending",
                          style: GoogleFonts.inter(
                            color: ColorConst.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "My Crypto Address ...",
            style: GoogleFonts.inter(
              color: ColorConst.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: w * 0.38,
                height: isTablet ? h * 0.3 : h * 0.12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: ColorConst.grey, width: w * 0.003)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" TRC20",
                        style: GoogleFonts.inter(
                            color: const Color(0xFFC084FC), fontSize: 12)),
                    Text(
                      " TQ9ac9...LX3P9Z",
                      style: GoogleFonts.inter(
                        color: ColorConst.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: w * 0.05,
              ),
              Container(
                width: w * 0.38,
                height: isTablet ? h * 0.3 : h * 0.12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: ColorConst.grey, width: w * 0.003)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" TRC20",
                        style: GoogleFonts.inter(
                            color: const Color(0xFFC084FC), fontSize: 12)),
                    const SizedBox(height: 6),
                    Text(
                      " TQ9ac9...LX3P9Z",
                      style: GoogleFonts.inter(
                        color: ColorConst.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool _isTransactionExpanded = false;

  Widget _transactionTile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorConst.cardDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _isTransactionExpanded
              ? Row(
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
                )
              : Text(
                  "Total Transaction Overview",
                  style: GoogleFonts.inter(
                    color: ColorConst.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
          const SizedBox(height: 10),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: _isTransactionExpanded
                ? _buildExpandedView()
                : _buildCollapsedView(),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedView() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount:
              transactions.length > 3 ? 3 : transactions.length, // Show max 3
          itemBuilder: (context, index) {
            final item = transactions[index];
            return InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor:
                      Colors.transparent, // Allow blur to show through
                  builder: (context) =>
                      TransactionDetailsSheet(transaction: item),
                );
              },
              child: _transactionRow(
                  item), // Keep original row style for collapsed? Or match expanded?
              // User said "replace... with content from sheet".
              // I will stick to original style for collapsed to match "before" state perception,
              // but the expanded view will use the new style.
            );
          },
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isTransactionExpanded = true;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.white,
              foregroundColor: ColorConst.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700),
            ),
            child: const Text("View All"),
          ),
        )
      ],
    );
  }

  Widget _buildExpandedView() {
    return Column(
      children: [
        // LIST (From TransactionHistorySheet logic)
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length + 1, // +1 for header
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  "November 30th, 2025", // Hardcoded per sheet example
                  style: GoogleFonts.inter(
                    color: ColorConst.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }
            final item = transactions[index - 1];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor:
                        Colors.transparent, // Allow blur to show through
                    builder: (context) =>
                        TransactionDetailsSheet(transaction: item),
                  );
                },
                child: _buildTransactionTileNew(item), // New style
              ),
            );
          },
        ),

        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isTransactionExpanded = false;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[400], // Distinct color for collapse
              foregroundColor: ColorConst.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700),
            ),
            child: const Text("Show Less"),
          ),
        )
      ],
    );
  }

  // Copied from TransactionHistorySheet
  Widget _buildTransactionTileNew(TransactionItem item) {
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
              color: item.iconBgColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                item.icon,
                color: item.iconBgColor,
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
                  : const Color(0xffEF4444),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 13),
          Text(
            item.amount,
            style: GoogleFonts.inter(
              color:
                  item.isApproved ? const Color(0xff4ADE80) : ColorConst.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }

  Widget _transactionRow(TransactionItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // ICON
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: item.iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              item.icon,
              color: Colors.white,
              width: 20,
              height: 20,
            ),
          ),

          const SizedBox(width: 12),

          // TITLE + DATE
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.inter(
                    fontSize: 16, // Fixed size for consistency
                    color: ColorConst.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  item.date,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: ColorConst.grey,
                  ),
                ),
              ],
            ),
          ),

          // STATUS
          Text(
            item.isApproved ? "Approved" : "Rejected",
            style: GoogleFonts.inter(
              fontSize: 13,
              color:
                  item.isApproved ? const Color(0xFF4ADE80) : Colors.redAccent,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(width: 10),

          // AMOUNT
          Text(
            item.amount,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: item.amount.startsWith("+")
                  ? const Color(0xFF4ADE80)
                  : Colors.grey.shade200,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
