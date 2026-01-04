import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/colorConst.dart';

class OverallProfitLossList extends StatefulWidget {
  const OverallProfitLossList({super.key});

  @override
  State<OverallProfitLossList> createState() => _OverallProfitLossListState();
}

class _OverallProfitLossListState extends State<OverallProfitLossList> {
  // Updated dummy data with Units and Current Price
  final List<Map<String, dynamic>> _trades = [
    {
      "symbol": "USDXAU",
      "type": "BUY",
      "units": "100",
      "currentPrice": "100.00",
      "pl": "+\$22.00",
      "isProfit": true,
      "details": {
        "openPrice": "1950.50",
        "sl": "1940.00",
        "tp": "1980.00",
        "swap": "-1.50"
      }
    },
    {
      "symbol": "USDXEUR",
      "type": "SELL",
      "units": "150",
      "currentPrice": "150.00",
      "pl": "-\$12.00",
      "isProfit": false,
      "details": {
        "openPrice": "1.0850",
        "sl": "1.0900",
        "tp": "1.0750",
        "swap": "0.50"
      }
    },
    {
      "symbol": "USDXJPY",
      "type": "BUY",
      "units": "200",
      "currentPrice": "200.00",
      "pl": "+\$45.00",
      "isProfit": true,
      "details": {
        "openPrice": "145.50",
        "sl": "146.00",
        "tp": "144.00",
        "swap": "1.20"
      }
    },
    {
      "symbol": "BTCUSD",
      "type": "BUY",
      "units": "0.5",
      "currentPrice": "42000.00",
      "pl": "+\$1234.00",
      "isProfit": true,
      "details": {
        "openPrice": "40000.00",
        "sl": "39000.00",
        "tp": "45000.00",
        "swap": "-10.50"
      }
    },
  ];

  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredTrades = _trades.where((trade) {
      final query = _searchQuery.toLowerCase();
      return trade['symbol'].toString().toLowerCase().contains(query);
    }).toList();

    return Column(
      children: [
        // Search and Filter Bar
        Row(
          children: [
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: ColorConst.cardDark,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white12),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  style: GoogleFonts.inter(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    hintText: "Search Investments",
                    hintStyle:
                        GoogleFonts.inter(color: Colors.grey, fontSize: 14),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: ColorConst.cardDark,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white12),
              ),
              child: const Icon(Icons.filter_list, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Headers
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text("Symbol",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text("Units",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text("Current Price",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Floating P/L",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(width: 30), // Space for arrow
            ],
          ),
        ),
        const SizedBox(height: 12),

        // List Items
        filteredTrades.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(20),
                child: Text("No investments found",
                    style: GoogleFonts.inter(color: Colors.grey)),
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredTrades.length,
                itemBuilder: (context, index) {
                  final trade = filteredTrades[index];
                  return Container(
                    key: ValueKey(
                        trade['symbol']), // Add key for better performance
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: ColorConst.cardDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        iconColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        tilePadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        title: Row(
                          children: [
                            // Symbol Column
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    trade['symbol'],
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    trade['type'],
                                    style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Units Column
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  trade['units'],
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            // Current Price Column
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  trade['currentPrice'],
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            // P/L Column
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  trade['pl'],
                                  style: GoogleFonts.inter(
                                    color: trade['isProfit']
                                        ? const Color(0xFF4ADE80)
                                        : const Color(0xFFEF4444),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Column(
                              children: [
                                Divider(color: Colors.white.withOpacity(0.1)),
                                const SizedBox(height: 8),
                                _detailRow("Open Price",
                                    trade['details']['openPrice']),
                                const SizedBox(height: 8),
                                _detailRow("Stop Loss", trade['details']['sl']),
                                const SizedBox(height: 8),
                                _detailRow(
                                    "Take Profit", trade['details']['tp']),
                                const SizedBox(height: 8),
                                _detailRow("Swap", trade['details']['swap']),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ],
    );
  }

  Widget _detailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(color: Colors.grey, fontSize: 12),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
        ),
      ],
    );
  }
}
