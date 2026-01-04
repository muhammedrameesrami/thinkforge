import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/colorConst.dart';

class WalletHelpers {
  // Bottom Sheet 1: Transaction Receipt
  static void showTransactionReceipt(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorConst.cardDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 24),
              const Icon(Icons.check_circle,
                  size: 64, color: Color(0xFF4ADE80)),
              const SizedBox(height: 16),
              Text("Transaction Successful",
                  style: GoogleFonts.inter(
                      color: ColorConst.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text("You have successfully deposited \$1,200.00",
                  style:
                      GoogleFonts.inter(color: ColorConst.grey, fontSize: 14)),
              const SizedBox(height: 32),
              _detailRow("Transaction ID", "TRX-987654321"),
              _detailRow("Date", "Jan 02, 2026"),
              _detailRow("Time", "10:30 AM"),
              _detailRow("Status", "Completed"),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showTransferStep3(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConst.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    textStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  ),
                  child: const Text("Continue"),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // Bottom Sheet 2: Wallet Transfer Step 3
  static void showTransferStep3(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorConst.cardDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 24),
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white)),
                  Text("Wallet Transfer",
                      style: GoogleFonts.inter(
                          color: ColorConst.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 24),
              // Step Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _stepDot(true), const SizedBox(width: 8),
                  _stepDot(true), const SizedBox(width: 8),
                  _stepDot(true), // Step 3
                ],
              ),
              const SizedBox(height: 32),
              // Payment Info
              Text("\$ 1,200.00",
                  style: GoogleFonts.inter(
                      color: ColorConst.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              Text("Total Amount",
                  style: GoogleFonts.inter(color: ColorConst.grey)),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.account_balance_wallet,
                        color: ColorConst.white),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Main Wallet",
                            style: GoogleFonts.inter(
                                color: ColorConst.white,
                                fontWeight: FontWeight.w600)),
                        Text("**** **** 1234",
                            style: GoogleFonts.inter(
                                color: ColorConst.grey, fontSize: 12)),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.check_circle, color: ColorConst.white),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Finish logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4ADE80),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    textStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  ),
                  child: const Text("Confirm Transfer"),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.inter(color: ColorConst.grey)),
          Text(value,
              style: GoogleFonts.inter(
                  color: ColorConst.white, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  static Widget _stepDot(bool isActive) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
          color: isActive ? ColorConst.primaryBlue : Colors.white24,
          shape: BoxShape.circle),
    );
  }
}
