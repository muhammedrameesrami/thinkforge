import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thinkforege/features/overall_pl_list.dart';
import 'core/constants/colorConst.dart';

class OverallProfitLossScreen extends StatelessWidget {
  const OverallProfitLossScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.appBackground,
      appBar: AppBar(
        backgroundColor: ColorConst.appBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorConst.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Overall P/L",
          style: GoogleFonts.inter(
            color: ColorConst.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const OverallProfitLossList(),
    );
  }
}
