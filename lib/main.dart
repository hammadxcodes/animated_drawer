// import 'package:flutter/material.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Crypto Portfolio',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFF6E56F8),
//           brightness: Brightness.light,
//           primary: const Color(0xFF6E56F8),
//           secondary: const Color(0xFF22E09A),
//         ),
//         useMaterial3: true,
//         fontFamily: 'Inter',
//         scaffoldBackgroundColor: const Color(0xFFF8F9FA),
//         appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
//       ),
//       darkTheme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFF6E56F8),
//           brightness: Brightness.dark,
//           primary: const Color(0xFF6E56F8),
//           secondary: const Color(0xFF22E09A),
//           background: const Color(0xFF0E1117),
//           surface: const Color(0xFF1A1F29),
//         ),
//         useMaterial3: true,
//         fontFamily: 'Inter',
//         scaffoldBackgroundColor: const Color(0xFF0E1117),
//       ),
//       themeMode: ThemeMode.dark,
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final zoomDrawerController = ZoomDrawerController();

//   final List<CryptoAsset> _cryptoAssets = [
//     CryptoAsset(
//       name: "Bitcoin",
//       symbol: "BTC",
//       price: 51275.80,
//       change: 2.4,
//       holdings: 0.45,
//       iconPath: "assets/btc.png",
//     ),
//     CryptoAsset(
//       name: "Ethereum",
//       symbol: "ETH",
//       price: 2835.65,
//       change: -1.2,
//       holdings: 4.75,
//       iconPath: "assets/eth.png",
//     ),
//     CryptoAsset(
//       name: "Solana",
//       symbol: "SOL",
//       price: 142.20,
//       change: 5.7,
//       holdings: 28.5,
//       iconPath: "assets/sol.png",
//     ),
//     CryptoAsset(
//       name: "Cardano",
//       symbol: "ADA",
//       price: 0.58,
//       change: 1.8,
//       holdings: 1250.0,
//       iconPath: "assets/ada.png",
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return ZoomDrawer(
//       controller: zoomDrawerController,
//       menuBackgroundColor: isDark ? colorScheme.surface : Colors.white,
//       shadowLayer1Color:
//           isDark ? colorScheme.surfaceVariant : const Color(0xFFF5F5F5),
//       shadowLayer2Color:
//           isDark
//               ? colorScheme.surfaceVariant.withOpacity(0.7)
//               : const Color(0xFFE6E6E6).withOpacity(0.3),
//       borderRadius: 24.0,
//       showShadow: true,
//       angle: -12.0,
//       drawerShadowsBackgroundColor:
//           isDark ? Colors.black38 : Colors.grey.shade300,
//       slideWidth: MediaQuery.of(context).size.width * 0.7,
//       menuScreen: _buildMenuScreen(context),
//       mainScreen: _buildMainScreen(context),
//     );
//   }

//   Widget _buildMenuScreen(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: IconButton(
//                 onPressed: () => zoomDrawerController.toggle?.call(),
//                 icon: Icon(
//                   Icons.close_rounded,
//                   color: colorScheme.onSurface,
//                   size: 28,
//                 ),
//                 style: IconButton.styleFrom(
//                   backgroundColor:
//                       isDark
//                           ? colorScheme.surfaceVariant
//                           : colorScheme.primaryContainer.withOpacity(0.3),
//                   padding: const EdgeInsets.all(8),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Profile section
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundColor: colorScheme.primary,
//                     child: Icon(
//                       Icons.person_rounded,
//                       size: 40,
//                       color: colorScheme.onPrimary,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     "Hammad Ali",
//                     style: textTheme.headlineSmall?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: colorScheme.onSurface,
//                     ),
//                   ),
//                   Text(
//                     "hammad.ali@example.com",
//                     style: textTheme.bodyMedium?.copyWith(
//                       color: colorScheme.onSurfaceVariant,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 32),
//             const Divider(),
//             const SizedBox(height: 8),
//             // Menu items
//             _buildMenuItem(
//               context,
//               "Portfolio",
//               Icons.pie_chart_rounded,
//               isSelected: true,
//             ),
//             _buildMenuItem(context, "Market", Icons.trending_up_rounded),
//             _buildMenuItem(context, "Transactions", Icons.swap_horiz_rounded),
//             _buildMenuItem(context, "News", Icons.newspaper_rounded),
//             _buildMenuItem(context, "Settings", Icons.settings_rounded),
//             const Spacer(),
//             // Logout button
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: ElevatedButton.icon(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: colorScheme.primary.withOpacity(0.1),
//                   foregroundColor: colorScheme.primary,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 12,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 0,
//                 ),
//                 icon: const Icon(Icons.logout_rounded),
//                 label: Text(
//                   "Log out",
//                   style: textTheme.labelLarge?.copyWith(
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMenuItem(
//     BuildContext context,
//     String title,
//     IconData icon, {
//     bool isSelected = false,
//   }) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//       child: Material(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(16),
//         child: InkWell(
//           onTap: () {
//             zoomDrawerController.toggle?.call();
//           },
//           borderRadius: BorderRadius.circular(16),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//             decoration: BoxDecoration(
//               color:
//                   isSelected
//                       ? colorScheme.primaryContainer
//                       : Colors.transparent,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   icon,
//                   size: 24,
//                   color:
//                       isSelected
//                           ? colorScheme.primary
//                           : colorScheme.onSurfaceVariant,
//                 ),
//                 const SizedBox(width: 16),
//                 Text(
//                   title,
//                   style: textTheme.titleMedium?.copyWith(
//                     color:
//                         isSelected
//                             ? colorScheme.primary
//                             : colorScheme.onSurface,
//                     fontWeight:
//                         isSelected ? FontWeight.w600 : FontWeight.normal,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMainScreen(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Scaffold(
//       backgroundColor: colorScheme.background,
//       appBar: AppBar(
//         backgroundColor: colorScheme.background,
//         title: Text(
//           "Crypto Portfolio",
//           style: textTheme.titleLarge?.copyWith(
//             fontWeight: FontWeight.bold,
//             color: colorScheme.onBackground,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () => zoomDrawerController.toggle?.call(),
//           icon: Icon(Icons.menu_rounded, color: colorScheme.onBackground),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.notifications_none_rounded,
//               color: colorScheme.onBackground,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Welcome header
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 24,
//                     backgroundColor: colorScheme.primary,
//                     child: Text(
//                       "HA",
//                       style: textTheme.titleMedium?.copyWith(
//                         color: colorScheme.onPrimary,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Welcome back,",
//                         style: textTheme.bodyMedium?.copyWith(
//                           color: colorScheme.onSurfaceVariant,
//                         ),
//                       ),
//                       Text(
//                         "Hammad Ali",
//                         style: textTheme.titleMedium?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: colorScheme.onBackground,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               // Portfolio value card
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [colorScheme.primary, const Color(0xFF8A70FF)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Total Portfolio Value",
//                         style: textTheme.titleMedium?.copyWith(
//                           color: Colors.white.withOpacity(0.8),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         "\$42,582.65",
//                         style: textTheme.headlineLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 8,
//                               vertical: 4,
//                             ),
//                             decoration: BoxDecoration(
//                               color: colorScheme.secondary.withOpacity(0.2),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.arrow_upward_rounded,
//                                   size: 16,
//                                   color: colorScheme.secondary,
//                                 ),
//                                 const SizedBox(width: 4),
//                                 Text(
//                                   "3.2%",
//                                   style: textTheme.bodyMedium?.copyWith(
//                                     color: colorScheme.secondary,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Text(
//                             "Today",
//                             style: textTheme.bodyMedium?.copyWith(
//                               color: Colors.white.withOpacity(0.8),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _buildActionButton(
//                             "Deposit",
//                             Icons.arrow_downward_rounded,
//                             colorScheme.secondary,
//                           ),
//                           _buildActionButton(
//                             "Withdraw",
//                             Icons.arrow_upward_rounded,
//                             Colors.white,
//                           ),
//                           _buildActionButton(
//                             "Swap",
//                             Icons.swap_horiz_rounded,
//                             Colors.white,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               // Market trends section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Market Trends",
//                     style: textTheme.titleMedium?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: colorScheme.onBackground,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       "See All",
//                       style: textTheme.bodyMedium?.copyWith(
//                         color: colorScheme.primary,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               // Market trend cards
//               SizedBox(
//                 height: 120,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     _buildTrendCard(context, "BTC", 51275.80, 2.4),
//                     _buildTrendCard(context, "ETH", 2835.65, -1.2),
//                     _buildTrendCard(context, "SOL", 142.20, 5.7),
//                     _buildTrendCard(context, "ADA", 0.58, 1.8),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//               // Your assets section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Your Assets",
//                     style: textTheme.titleMedium?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: colorScheme.onBackground,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       "See All",
//                       style: textTheme.bodyMedium?.copyWith(
//                         color: colorScheme.primary,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               // Asset list
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: _cryptoAssets.length,
//                 itemBuilder: (context, index) {
//                   final asset = _cryptoAssets[index];
//                   return _buildAssetItem(context, asset);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: colorScheme.primary,
//         foregroundColor: colorScheme.onPrimary,
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         onPressed: () {},
//         child: const Icon(Icons.add_rounded, size: 28),
//       ),
//     );
//   }

//   Widget _buildActionButton(String label, IconData icon, Color color) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.15),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Icon(icon, color: color, size: 24),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           label,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 12,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTrendCard(
//     BuildContext context,
//     String symbol,
//     double price,
//     double change,
//   ) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Container(
//       width: 150,
//       margin: const EdgeInsets.only(right: 12),
//       decoration: BoxDecoration(
//         color: isDark ? colorScheme.surface : Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: colorScheme.primary.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     symbol,
//                     style: textTheme.labelMedium?.copyWith(
//                       color: colorScheme.primary,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 Icon(
//                   change >= 0
//                       ? Icons.arrow_upward_rounded
//                       : Icons.arrow_downward_rounded,
//                   size: 16,
//                   color: change >= 0 ? colorScheme.secondary : Colors.red,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Text(
//               "\$${price.toStringAsFixed(2)}",
//               style: textTheme.titleMedium?.copyWith(
//                 fontWeight: FontWeight.bold,
//                 color: colorScheme.onSurface,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               "${change >= 0 ? "+" : ""}${change.toStringAsFixed(1)}%",
//               style: textTheme.bodyMedium?.copyWith(
//                 color: change >= 0 ? colorScheme.secondary : Colors.red,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildAssetItem(BuildContext context, CryptoAsset asset) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     final totalValue = asset.price * asset.holdings;

//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: isDark ? colorScheme.surface : Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           children: [
//             // Coin icon placeholder
//             Container(
//               width: 48,
//               height: 48,
//               decoration: BoxDecoration(
//                 color: colorScheme.primary.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Center(
//                 child: Text(
//                   asset.symbol.substring(0, 1),
//                   style: textTheme.titleLarge?.copyWith(
//                     color: colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             // Coin details
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     asset.name,
//                     style: textTheme.titleMedium?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: colorScheme.onSurface,
//                     ),
//                   ),
//                   Text(
//                     "${asset.holdings} ${asset.symbol}",
//                     style: textTheme.bodyMedium?.copyWith(
//                       color: colorScheme.onSurfaceVariant,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Price details
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   "\$${totalValue.toStringAsFixed(2)}",
//                   style: textTheme.titleMedium?.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: colorScheme.onSurface,
//                   ),
//                 ),
//                 Text(
//                   "${asset.change >= 0 ? "+" : ""}${asset.change.toStringAsFixed(1)}%",
//                   style: textTheme.bodyMedium?.copyWith(
//                     color:
//                         asset.change >= 0 ? colorScheme.secondary : Colors.red,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CryptoAsset {
//   final String name;
//   final String symbol;
//   final double price;
//   final double change;
//   final double holdings;
//   final String iconPath;

//   CryptoAsset({
//     required this.name,
//     required this.symbol,
//     required this.price,
//     required this.change,
//     required this.holdings,
//     required this.iconPath,
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7F5AF0),
          brightness: Brightness.light,
          primary: const Color(0xFF7F5AF0),
          secondary: const Color(0xFF2CB67D),
          tertiary: const Color(0xFFF582AE),
          surfaceTint: Colors.transparent,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.outfit().fontFamily,
        scaffoldBackgroundColor: const Color(0xFFF9FAFB),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7F5AF0),
          brightness: Brightness.dark,
          primary: const Color(0xFF7F5AF0),
          secondary: const Color(0xFF2CB67D),
          tertiary: const Color(0xFFF582AE),
          background: const Color(0xFF16161A),
          surface: const Color(0xFF242629),
          surfaceTint: Colors.transparent,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.outfit().fontFamily,
        scaffoldBackgroundColor: const Color(0xFF16161A),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final zoomDrawerController = ZoomDrawerController();

  final List<CryptoAsset> _cryptoAssets = [
    CryptoAsset(
      name: "Bitcoin",
      symbol: "BTC",
      price: 51275.80,
      change: 2.4,
      holdings: 0.45,
      color: const Color(0xFFF7931A),
    ),
    CryptoAsset(
      name: "Ethereum",
      symbol: "ETH",
      price: 2835.65,
      change: -1.2,
      holdings: 4.75,
      color: const Color(0xFF627EEA),
    ),
    CryptoAsset(
      name: "Solana",
      symbol: "SOL",
      price: 142.20,
      change: 5.7,
      holdings: 28.5,
      color: const Color(0xFF00FFA3),
    ),
    CryptoAsset(
      name: "Cardano",
      symbol: "ADA",
      price: 0.58,
      change: 1.8,
      holdings: 1250.0,
      color: const Color(0xFF0033AD),
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ZoomDrawer(
      controller: zoomDrawerController,
      menuBackgroundColor: isDark ? colorScheme.surface : Colors.white,
      shadowLayer1Color:
          isDark ? colorScheme.surfaceVariant : const Color(0xFFF5F5F5),
      shadowLayer2Color:
          isDark
              ? colorScheme.surfaceVariant.withOpacity(0.7)
              : const Color(0xFFE6E6E6).withOpacity(0.3),
      borderRadius: 32.0,
      showShadow: true,
      style: DrawerStyle.defaultStyle,
      angle: -12.0,
      drawerShadowsBackgroundColor:
          isDark ? Colors.black38 : Colors.grey.shade300,
      slideWidth: MediaQuery.of(context).size.width * 0.7,
      menuScreen: _buildMenuScreen(context),
      mainScreen: _buildMainScreen(context),
    );
  }

  Widget _buildMenuScreen(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: IconButton(
                    onPressed: () => zoomDrawerController.toggle?.call(),
                    icon: Icon(
                      Icons.close_rounded,
                      color: colorScheme.onSurface,
                      size: 28,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor:
                          isDark
                              ? colorScheme.surfaceVariant
                              : colorScheme.primaryContainer.withOpacity(0.3),
                      padding: const EdgeInsets.all(8),
                    ),
                  ),
                ),
                Text(
                  "Menu",
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: 50),
              ],
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile section
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.primary,
                          colorScheme.primary.withOpacity(0.7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          child: Text(
                            "HA",
                            style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hammad Ali",
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "hammad.ali@example.com",
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Menu items
            _buildMenuItem(context, "Portfolio", Icons.pie_chart_rounded, 0),
            _buildMenuItem(context, "Market", Icons.trending_up_rounded, 1),
            _buildMenuItem(
              context,
              "Transactions",
              Icons.swap_horiz_rounded,
              2,
            ),
            _buildMenuItem(context, "News", Icons.newspaper_rounded, 3),
            _buildMenuItem(context, "Settings", Icons.settings_rounded, 4),
            const Spacer(),
            // Logout button
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.errorContainer,
                  foregroundColor: colorScheme.error,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                icon: const Icon(Icons.logout_rounded),
                label: Text(
                  "Log out",
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    int index,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isSelected = index == _selectedIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
            zoomDrawerController.toggle?.call();
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? colorScheme.primaryContainer
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? colorScheme.primary.withOpacity(0.2)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    size: 24,
                    color:
                        isSelected
                            ? colorScheme.primary
                            : colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    color:
                        isSelected
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                if (isSelected) ...[
                  const Spacer(),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainScreen(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => zoomDrawerController.toggle?.call(),
                        icon: Icon(
                          Icons.menu_rounded,
                          color: colorScheme.onBackground,
                          size: 28,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor:
                              isDark
                                  ? colorScheme.surfaceVariant.withOpacity(0.5)
                                  : colorScheme.primaryContainer.withOpacity(
                                    0.2,
                                  ),
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Portfolio",
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search_rounded,
                          color: colorScheme.onBackground,
                          size: 28,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor:
                              isDark
                                  ? colorScheme.surfaceVariant.withOpacity(0.5)
                                  : colorScheme.primaryContainer.withOpacity(
                                    0.2,
                                  ),
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_rounded,
                              color: colorScheme.onBackground,
                              size: 28,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  isDark
                                      ? colorScheme.surfaceVariant.withOpacity(
                                        0.5,
                                      )
                                      : colorScheme.primaryContainer
                                          .withOpacity(0.2),
                              padding: const EdgeInsets.all(8),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: colorScheme.error,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: colorScheme.background,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Portfolio value card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [colorScheme.primary, const Color(0xFF9F7FFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Portfolio Value",
                                style: textTheme.titleMedium?.copyWith(
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.secondary.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_upward_rounded,
                                      size: 16,
                                      color: colorScheme.secondary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "3.2%",
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.secondary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$42,582",
                                style: textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 36,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Text(
                                  ".65",
                                  style: textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildGlassActionButton(
                                "Deposit",
                                Icons.arrow_downward_rounded,
                                colorScheme.secondary,
                              ),
                              _buildGlassActionButton(
                                "Withdraw",
                                Icons.arrow_upward_rounded,
                                Colors.white,
                              ),
                              _buildGlassActionButton(
                                "Swap",
                                Icons.swap_horiz_rounded,
                                Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Market trends section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Market Trends",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onBackground,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: colorScheme.primary,
                          side: BorderSide(
                            color: colorScheme.primary.withOpacity(0.5),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "See All",
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Market trend cards
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildTrendCard(
                          context,
                          "BTC",
                          51275.80,
                          2.4,
                          const Color(0xFFF7931A),
                        ),
                        _buildTrendCard(
                          context,
                          "ETH",
                          2835.65,
                          -1.2,
                          const Color(0xFF627EEA),
                        ),
                        _buildTrendCard(
                          context,
                          "SOL",
                          142.20,
                          5.7,
                          const Color(0xFF00FFA3),
                        ),
                        _buildTrendCard(
                          context,
                          "ADA",
                          0.58,
                          1.8,
                          const Color(0xFF0033AD),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Your assets section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Assets",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onBackground,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: colorScheme.primary,
                          side: BorderSide(
                            color: colorScheme.primary.withOpacity(0.5),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "See All",
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Asset list
                  ...List.generate(_cryptoAssets.length, (index) {
                    return _buildAssetItem(context, _cryptoAssets[index]);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {},
        child: const Icon(Icons.add_rounded, size: 28),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: isDark ? colorScheme.surface : Colors.white,
        indicatorColor: colorScheme.primaryContainer,
        elevation: 0,
        height: 70,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.pie_chart_outline_rounded),
            selectedIcon: Icon(Icons.pie_chart_rounded),
            label: 'Portfolio',
          ),
          NavigationDestination(
            icon: Icon(Icons.trending_up_outlined),
            selectedIcon: Icon(Icons.trending_up_rounded),
            label: 'Market',
          ),
          NavigationDestination(
            icon: Icon(Icons.swap_horiz_outlined),
            selectedIcon: Icon(Icons.swap_horiz_rounded),
            label: 'Trade',
          ),
          NavigationDestination(
            icon: Icon(Icons.newspaper_outlined),
            selectedIcon: Icon(Icons.newspaper_rounded),
            label: 'News',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildGlassActionButton(String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildTrendCard(
    BuildContext context,
    String symbol,
    double price,
    double change,
    Color coinColor,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: isDark ? colorScheme.surface : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: coinColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    symbol,
                    style: textTheme.titleSmall?.copyWith(
                      color: coinColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$${price < 100 ? price.toStringAsFixed(2) : price.toInt().toString()}",
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                if (price >= 100) ...[
                  Text(
                    price
                        .toStringAsFixed(2)
                        .substring(price.toInt().toString().length),
                    style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color:
                        change >= 0
                            ? colorScheme.secondary.withOpacity(0.2)
                            : colorScheme.error.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        change >= 0
                            ? Icons.arrow_upward_rounded
                            : Icons.arrow_downward_rounded,
                        size: 14,
                        color:
                            change >= 0
                                ? colorScheme.secondary
                                : colorScheme.error,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${change >= 0 ? "+" : ""}${change.toStringAsFixed(1)}%",
                        style: textTheme.bodySmall?.copyWith(
                          color:
                              change >= 0
                                  ? colorScheme.secondary
                                  : colorScheme.error,
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
      ),
    );
  }

  Widget _buildAssetItem(BuildContext context, CryptoAsset asset) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final totalValue = asset.price * asset.holdings;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDark ? colorScheme.surface : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Coin icon
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: asset.color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    asset.symbol.substring(0, 1),
                    style: textTheme.titleLarge?.copyWith(
                      color: asset.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Coin details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      asset.name,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      asset.symbol,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Coin value and change
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${totalValue.toStringAsFixed(2)}",
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        asset.change >= 0
                            ? Icons.arrow_upward_rounded
                            : Icons.arrow_downward_rounded,
                        size: 14,
                        color:
                            asset.change >= 0
                                ? colorScheme.secondary
                                : colorScheme.error,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${asset.change >= 0 ? "+" : ""}${asset.change.toStringAsFixed(1)}%",
                        style: textTheme.bodySmall?.copyWith(
                          color:
                              asset.change >= 0
                                  ? colorScheme.secondary
                                  : colorScheme.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CryptoAsset {
  final String name;
  final String symbol;
  final double price;
  final double change;
  final double holdings;
  final Color color;

  CryptoAsset({
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.holdings,
    required this.color,
  });
}
