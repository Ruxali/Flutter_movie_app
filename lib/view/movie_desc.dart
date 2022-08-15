import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/controller/movieController.dart';
import 'package:provider/provider.dart';

class MovieDescription extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  var item;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // var favoriteBloc = Provider.of<FavoriteBloc>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Obx(
        () {
          return movieController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  '$bgURL${movieController.movie.value.bgURL}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: size.width,
                          padding: EdgeInsets.all(25),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text(
                                  "${movieController.movie.value.title}",
                                  style: GoogleFonts.roboto(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      '${movieController.movie.value.releaseYear}',
                                      // '15+',
                                      '${movieController.movie.value.runtime} minutes'
                                    ]
                                        .map((e) => Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 5, 10, 0),
                                              child: Text('$e'),
                                            ))
                                        .toList()),
                              ),
                              Wrap(
                                children: movieController.movie.value.category
                                    .map((e) => Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 10, 0),
                                          child: Chip(
                                              label: Text(
                                            '$e',
                                            style: GoogleFonts.roboto(
                                                fontSize: 15),
                                          )),
                                        ))
                                    .toList(),
                              ),
                              SizedBox(height: 18),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Overview',
                                    style: GoogleFonts.roboto(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                      '${movieController.movie.value.overview}',
                                      style:
                                          GoogleFonts.roboto(fontSize: 22.0)),
                                ],
                              ),
                              SizedBox(height: 18),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
