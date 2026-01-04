import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/colorConst.dart';
import '../core/constants/imageconst.dart';
import '../core/common/comon.dart';

class TransferStep3Sheet extends StatefulWidget {
  const TransferStep3Sheet({super.key});

  @override
  State<TransferStep3Sheet> createState() => _TransferStep3SheetState();
}

class _TransferStep3SheetState extends State<TransferStep3Sheet> {
  double _dragExtent = 0.0;
  // final double _height = 60.0; // Moved to build
  // final double _handleWidth = 44.0; // Moved to build
  // final double _padding = 8.0; // Moved to build

  bool _confirmed = false;

  void _onDragUpdate(DragUpdateDetails details, double maxDragWidth) {
    if (_confirmed) return;
    setState(() {
      _dragExtent += details.delta.dx;
      if (_dragExtent < 0) _dragExtent = 0;
      if (_dragExtent > maxDragWidth) _dragExtent = maxDragWidth;
    });
  }

  void _onDragEnd(DragEndDetails details, double maxDragWidth) {
    if (_confirmed) return;
    if (_dragExtent > maxDragWidth * 0.8) {
      // Threshold reached - Snap to end and confirm
      setState(() {
        _dragExtent = maxDragWidth;
        _confirmed = true;
      });
      // TRIGGER TRANSFER ACTION HERE
      print("Transfer Confirmed!");

      // Optional: Add a delay and close sheet or navigate
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) Navigator.pop(context);
      });
    } else {
      // Snap back
      setState(() {
        _dragExtent = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      w = MediaQuery.of(context).size.width;
      h = MediaQuery.of(context).size.height;
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
            initialChildSize: isTablet ? 0.65 : 0.9,
            minChildSize: 0.5,
            maxChildSize: isTablet ? 0.75 : 0.95,
            expand: false,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: ColorConst.appBackground,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: h * 0.015),
                    Container(
                      width: w * 0.1,
                      height: h * 0.005,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    SizedBox(height: h * 0.025),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            // Amount Section
                            Text(
                              "Enter Amount to be transferred",
                              style: GoogleFonts.inter(
                                  color: ColorConst.grey,
                                  fontSize: isTablet ? w * 0.03 : w * 0.035),
                            ),
                            SizedBox(height: h * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$",
                                  style: GoogleFonts.inter(
                                    color: ColorConst.grey,
                                    fontSize: isTablet ? w * 0.05 : w * 0.06,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " 2000",
                                  style: GoogleFonts.inter(
                                    color: ColorConst.white,
                                    fontSize: isTablet ? w * 0.05 : w * 0.12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Converted value will be 1,77,371.80 INR",
                              style: GoogleFonts.inter(
                                  color: Colors.grey[600],
                                  fontSize: isTablet ? w * 0.02 : w * 0.03),
                            ),
                            SizedBox(height: h * 0.04),

                            // Note Input
                            Container(
                              padding: EdgeInsets.all(w * 0.04),
                              decoration: BoxDecoration(
                                color: ColorConst.cardDark,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit_outlined,
                                    color: Colors.white70,
                                    size: isTablet ? w * 0.03 : w * 0.06,
                                  ),
                                  SizedBox(width: w * 0.03),
                                  Text(
                                    "Type Note to be sent (Optional)",
                                    style: GoogleFonts.inter(
                                        color: Colors.white70,
                                        fontSize:
                                            isTablet ? w * 0.02 : w * 0.035),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: h * 0.015),

                            // Recipient Wallet Selector
                            Container(
                              padding: EdgeInsets.all(w * 0.04),
                              decoration: BoxDecoration(
                                color: ColorConst.cardDark,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Select Recipient wallet",
                                    style: GoogleFonts.inter(
                                        color: Colors.white70,
                                        fontSize:
                                            isTablet ? w * 0.02 : w * 0.035),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white70,
                                    size: isTablet ? w * 0.03 : w * 0.06,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: h * 0.03),

                            // Profile Cards
                            Row(
                              children: [
                                // SENDER
                                Expanded(
                                  child: _buildProfileCard(
                                    isTablet: isTablet,
                                    name: "Your Account",
                                    subtext: "Alicia Koch",
                                    image: ImageConst.avatar,
                                  ),
                                ),

                                // ARROW
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: w * 0.02),
                                  padding: EdgeInsets.all(w * 0.02),
                                  decoration: const BoxDecoration(
                                    color: ColorConst.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.arrow_forward,
                                      color: Colors.black,
                                      size: isTablet ? w * 0.02 : w * 0.05),
                                ),

                                // RECEIVER
                                Expanded(
                                  child: _buildProfileCard(
                                    isTablet: isTablet,
                                    name: "WLT 287292",
                                    subtext: "James McGee",
                                    image: ImageConst
                                        .frame, // Just using another image as placeholder
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: h * 0.03),

                            // Details Block
                            Container(
                              padding: EdgeInsets.all(w * 0.05),
                              decoration: BoxDecoration(
                                color: ColorConst.cardDark,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  _detailRow("Type", "MT5 Transfer", isTablet),
                                  SizedBox(height: h * 0.02),
                                  const Divider(color: Colors.white10),
                                  SizedBox(height: h * 0.02),
                                  _detailRow(
                                      "Sender ID", "WLT-2929292", isTablet),
                                  SizedBox(height: h * 0.02),
                                  _detailRow(
                                      "Recepient ID", "WLT-9829653", isTablet),
                                ],
                              ),
                            ),

                            SizedBox(height: h * 0.05),

                            // Interactive Swipe Button
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final double _height = h * 0.075;
                                final double _handleWidth = w * 0.11;
                                final double _padding = w * 0.02;
                                // Calculate the maximum width the slider can travel
                                // Total width - padding*2 - handle width
                                final double maxDragWidth =
                                    constraints.maxWidth -
                                        (_padding * 2) -
                                        _handleWidth;

                                return Container(
                                  height: _height,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: _confirmed
                                        ? Colors.green[800]
                                        : const Color(
                                            0xFF34D399), // Bright Green
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _padding),
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      // Centered Text
                                      Center(
                                        child: Text(
                                          _confirmed
                                              ? "Transfer Successful"
                                              : "Swipe to Transfer",
                                          style: GoogleFonts.inter(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                isTablet ? w * 0.03 : w * 0.04,
                                          ),
                                        ),
                                      ),
                                      // Sliding Handle
                                      Positioned(
                                        left: _dragExtent,
                                        child: GestureDetector(
                                          onHorizontalDragUpdate: (details) =>
                                              _onDragUpdate(
                                                  details, maxDragWidth),
                                          onHorizontalDragEnd: (details) =>
                                              _onDragEnd(details, maxDragWidth),
                                          child: Container(
                                            height:
                                                isTablet ? w * 0.04 : w * 0.1,
                                            width:
                                                isTablet ? w * 0.03 : w * 0.1,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                            ),
                                            child: Icon(
                                                _confirmed
                                                    ? Icons.check
                                                    : Icons.arrow_forward,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: h * 0.02),
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
    });
  }

  Widget _buildProfileCard(
      {required String name,
      required String subtext,
      required String image,
      required bool isTablet}) {
    // Dashed border is tricky in core flutter without package, using plain border or DashedRect implementation.
    // I will use a dashed-look border hack or just a solid border for simplicity unless requested complexity allows.
    // Screenshot shows a dashed border. I'll simulate with DottedBorder logic if I had the package,
    // but standard Border.all is safer for now. I'll use a slightly different background to pop it.

    return Container(
      padding: EdgeInsets.symmetric(vertical: h * 0.03, horizontal: w * 0.02),
      decoration: BoxDecoration(
        color: ColorConst.cardDark, // Dark bg
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: Colors.white12,
            style: BorderStyle.solid), // Simulating dash roughly
      ),
      child: Column(
        children: [
          Container(
            height: isTablet ? w * 0.09 : w * 0.13,
            width: isTablet ? w * 0.09 : w * 0.13,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: h * 0.015),
          Text(name,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isTablet ? w * 0.015 : w * 0.035)),
          SizedBox(height: h * 0.005),
          Text(subtext,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: isTablet ? w * 0.02 : w * 0.03)),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value, bool isTablet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: GoogleFonts.inter(
                color: ColorConst.grey,
                fontSize: isTablet ? w * 0.02 : w * 0.035)),
        Text(value,
            style: GoogleFonts.inter(
                color: ColorConst.white,
                fontWeight: FontWeight.w500,
                fontSize: isTablet ? w * 0.02 : w * 0.035)),
      ],
    );
  }
}
