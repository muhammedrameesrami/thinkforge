import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thinkforege/core/common/marquee_widget.dart';
import 'package:thinkforege/features/overall_pl_list.dart';
import 'core/constants/colorConst.dart';
import 'core/constants/imageconst.dart';

class TradingDashboardScreen extends StatefulWidget {
  const TradingDashboardScreen({super.key});

  @override
  State<TradingDashboardScreen> createState() => _TradingDashboardScreenState();
}

class _TradingDashboardScreenState extends State<TradingDashboardScreen>
    with SingleTickerProviderStateMixin {
  bool _showAllPL = false;

  @override
  Widget build(BuildContext context) {
    // Local variables for safety, shadowing globals if any
    // var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConst.appBackground, // Black
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            _topBar(),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Marquee Section
                    _marqueeSection(),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _balanceSection(),
                          const SizedBox(height: 24),
                          _actionButtons(),
                          const SizedBox(height: 24),
                          // Promo Banner (Frame) moved here as requested
                          _promoBanner(h),
                          const SizedBox(height: 24),
                          _transactionOverview(),
                          const SizedBox(height: 24),
                          _profitLossSection(context),
                          const SizedBox(height: 24),
                          _tradingTipCard(),
                          // const SizedBox(height: 24),
                          // _learningBanner(),
                          const SizedBox(height: 24),
                          // Calendar Container (Last)
                          _calendarBanner(),
                          const SizedBox(height: 80),
                        ],
                      ),
                    ), // Space for bottom nav
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- TOP BAR ----------------
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

  // ---------------- MARQUEE ----------------
  Widget _marqueeSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.green, // Preserved User's Green Color Change
      ),
      child: MarqueeWidget(
        child: Row(
          children: [
            const Icon(Icons.campaign, color: ColorConst.yellow, size: 16),
            const SizedBox(width: 8),
            Text(
              "Fast Withdrawals 🔒  Secure Trading = ⚡ Instant Deposit.",
              style: GoogleFonts.inter(
                color: ColorConst.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  // ---------------- BALANCE ----------------
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
      ],
    );
  }

  // ---------------- ACTION BUTTONS ----------------
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
        const SizedBox(width: 16),
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
      ],
    );
  }

  // ---------------- PROMO BANNER (FRAME) ----------------
  Widget _promoBanner(double h) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage(ImageConst.frame),
          fit: BoxFit.fill, // Changed to fill
        ),
      ),
    );
  }

  // ---------------- CALENDAR BANNER (LAST) ----------------
  Widget _calendarBanner() {
    // Using MediaQuery directly here as h is local to build
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    bool isTablet = w > 600;

    return Container(
      width: double.infinity,
      height: isTablet ? h * 0.9 : h * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage(ImageConst.calenderContainer),
          fit: BoxFit.fill, // Changed to fill
        ),
      ),
    );
  }

  // ---------------- TRANSACTION OVERVIEW ----------------
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
            "Total Transactions Overview",
            style: GoogleFonts.inter(
              color: ColorConst.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: w * 0.95,
            height: isTablet ? h * 0.35 : h * 0.2, // Increased for tablet
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorConst.grey, width: w * 0.003)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: w * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _statButton("W", true),
                    const SizedBox(height: 16),
                    Text("Transactions(1M)",
                        style: GoogleFonts.inter(
                            color: ColorConst.grey, fontSize: 12)),
                    const SizedBox(height: 6),
                    Text(
                      "\$556.89",
                      style: GoogleFonts.inter(
                        color: ColorConst.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: w * 0.02,
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _bar(40, ""),
                      const SizedBox(width: 3),
                      _bar(90, "Jun"),
                      const SizedBox(width: 3),
                      _bar(50, ""),
                      const SizedBox(width: 3),
                      _bar(30, "July"),
                      const SizedBox(width: 3),
                      _bar(80, ""),
                      const SizedBox(width: 3),
                      _bar(95, "Aug"),
                      const SizedBox(width: 3),
                      _bar(100, "Sep", isActive: true),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                  child: _smallDarkStat(
                      "Referral",
                      "+\$105.89",
                      const Color(0xFFC084FC),
                      const AssetImage(ImageConst.coin4))),
              const SizedBox(width: 12),
              Expanded(
                  child: _smallDarkStat(
                      "Bonus",
                      "+\$56.89",
                      const Color(0xFF4ADE80),
                      const AssetImage(ImageConst.crypto))),
            ],
          )
        ],
      ),
    );
  }

  // ---------------- P/L SECTION ----------------
  Widget _profitLossSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorConst.cardDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Overall P/L",
              style: GoogleFonts.inter(
                  color: ColorConst.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorConst.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: !_showAllPL
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _plStatItem("MT51192", "MT5 ID", ColorConst.white),
                      _plStatItem(
                          "+\$200.00", "Floating pnl", const Color(0xFF4ADE80)),
                      _plStatItem("22", "Open position", ColorConst.white),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "MT51i92",
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.keyboard_arrow_down,
                                    color: Colors.white54, size: 16)
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Column
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _expandedStatItem("Floating pnl", "+\$200.00",
                                    const Color(0xFF4ADE80)),
                                const SizedBox(height: 16),
                                _expandedStatItem(
                                    "Margin :", "\$20.00", ColorConst.white),
                                const SizedBox(height: 16),
                                _expandedStatItem(
                                    "Open positions :", "10", ColorConst.white),
                              ],
                            ),
                          ),
                          // Vertical Divider
                          Container(
                            width: 1,
                            height: 140, // Approximate height to match content
                            color: Colors.white10,
                          ),
                          const SizedBox(width: 24),
                          // Right Column
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _expandedStatItem("Net realized pnl",
                                    "-\$200.00", const Color(0xFFF43F5E)),
                                const SizedBox(height: 16),
                                _expandedStatItem(
                                    "Free margin", "\$20.00", ColorConst.white),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
          const SizedBox(height: 16),
          // Animated List Section
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _showAllPL
                ? const OverallProfitLossList()
                : _buildCollapsedList(),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _showAllPL = !_showAllPL;
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
              child: Text(_showAllPL ? "Hide" : "View All"),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCollapsedList() {
    return Column(
      children: [
        _tradeItem("USDXAU", "+\$244.00", "SL: \$14.00 TP: +\$344.00",
            "\$10.00 x 2.47 lots", const Color(0xFF4ADE80),
            isBuy: true),
        const SizedBox(height: 12),
        _tradeItem("USDXAU", "-\$244.00", "SL: \$14.00 TP: +\$344.00",
            "\$10.00 x 2.47 lots", const Color(0xFFEF4444),
            isBuy: false),
      ],
    );
  }

  // ---------------- TRADING TIP ----------------
  Widget _tradingTipCard() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    bool isTablet = w > 600;

    return Container(
      height: isTablet ? h * 0.8 : h * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF064E3B), Color(0xFF022C22)],
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: h * 0.05,
          ),
          Text(
            "Always use a stop-loss. It\nprotects your capital and\nprevents small losses\nfrom turning into account\nblowouts — discipline\nbeats guessing every\ntime.",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                color: ColorConst.white,
                fontSize: 15,
                height: 1.5,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text("Trading Tips",
              style: GoogleFonts.inter(color: Colors.white54, fontSize: 12)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                      color: Colors.white24, shape: BoxShape.circle)),
              const SizedBox(width: 6),
              Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                      color: ColorConst.white, shape: BoxShape.circle)),
              const SizedBox(width: 6),
              Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                      color: Colors.white24, shape: BoxShape.circle)),
            ],
          )
        ],
      ),
    );
  }

  // Helpers
  Widget _statButton(String label, bool isSelected) {
    return Row(
      children: ["W", "M", "Y"].map((e) {
        bool selected = e == label;
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected
                  ? ColorConst.white.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(e,
                style: GoogleFonts.inter(
                    color: ColorConst.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
        );
      }).toList(),
    );
  }

  Widget _bar(double heightFactor, String label, {bool isActive = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 14,
          height: heightFactor * 0.7,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF8B5CF6) : ColorConst.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: GoogleFonts.inter(color: ColorConst.grey, fontSize: 10)),
      ],
    );
  }

  Widget _smallDarkStat(
      String title, String value, Color color, AssetImage asset) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorConst.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: w * 0.002),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image(
              image: asset, // ✅ FIX
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.inter(
                color: color, fontSize: 12, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.inter(
                color: ColorConst.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _plStatItem(String value, String label, Color valueColor) {
    return Column(
      children: [
        Text(value,
            style: GoogleFonts.inter(
                color: valueColor, fontWeight: FontWeight.bold, fontSize: 14)),
        Text(label,
            style: GoogleFonts.inter(color: ColorConst.grey, fontSize: 10)),
      ],
    );
  }

  Widget _tradeItem(
      String symbol, String value, String sub1, String sub2, Color color,
      {required bool isBuy}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorConst.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: isBuy
                          ? const Color(0xFF4ADE80).withOpacity(0.2)
                          : const Color(0xFFEF4444).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(isBuy ? "Buy" : "Sell",
                        style: GoogleFonts.inter(
                            color: isBuy
                                ? const Color(0xFF4ADE80)
                                : const Color(0xFFEF4444),
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 8),
                  Text(symbol,
                      style: GoogleFonts.inter(
                          color: ColorConst.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ],
              ),
              const SizedBox(height: 6),
              Text(sub1,
                  style:
                      GoogleFonts.inter(color: ColorConst.grey, fontSize: 10)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value,
                  style: GoogleFonts.inter(
                      color: color, fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 6),
              Text(sub2,
                  style:
                      GoogleFonts.inter(color: ColorConst.grey, fontSize: 10)),
            ],
          )
        ],
      ),
    );
  }

  Widget _expandedStatItem(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.inter(color: ColorConst.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value,
            style: GoogleFonts.inter(
                color: valueColor, fontWeight: FontWeight.bold, fontSize: 20)),
      ],
    );
  }
}
