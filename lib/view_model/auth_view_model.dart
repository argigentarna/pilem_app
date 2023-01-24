// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/response/api_response.dart';
import '../model/genre_model.dart';
import '../repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  static List<Genres>? _listGenres = [];
  List<Genres>? get listGenres => _listGenres;
  set listGenres(List<Genres>? val) {
    _listGenres = val;
    notifyListeners();
  }

  int get countGenres {
    return _listGenres != null ? _listGenres!.length : 0;
  }

  Future<void> fetchGenres() async {
    _myRepo.fetchGenres().then(
      (value) {
        if (value.genres != null) {
          listGenres = value.genres;
        }
      },
    );
  }

  List listOfGenre(List listId) {
    List _listGenre = [];
    if (countGenres > 0) {
      for (var data in listGenres!) {
        for (var list in listId) {
          if (data.id == list) {
            _listGenre.add(data.name);
          }
        }
      }
    }

    return _listGenre.toList();
  }
}
