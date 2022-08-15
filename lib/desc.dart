// import 'package:flutter/material.dart';
// import 'package:movie_app/view/movie_desc.dart';
// import 'package:provider/provider.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Using MultiProvider is convenient when providing multiple objects.
//     return MultiProvider(
//       providers: [
//         // In this sample app, FavoriteListModel never changes, so a simple Provider
//         // is sufficient.
//         Provider(create: (context) => FavoriteListModel()),
//         // FavoritePageModel is implemented as a ChangeNotifier, which calls for the use
//         // of ChangeNotifierProvider. Moreover, FavoritePageModel depends
//         // on FavoriteListModel, so a ProxyProvider is needed.
//         ChangeNotifierProxyProvider<FavoriteListModel, FavoritePageModel>(
//           create: (context) => FavoritePageModel(),
//           update: (context, favoritelist, favoritepage) {
//             if (favoritepage == null)
//               throw ArgumentError.notNull('favoritepage');
//             favoritepage.favoritelist = favoritelist;
//             return favoritepage;
//           },
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Favorite Provider',
//         initialRoute: '/',
//         routes: {
//           '/': (context) => MovieDescription(),
//           '/favoritepage': (context) => MyFavorites(),
//         },
//       ),
//     );
//   }
// }
