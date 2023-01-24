// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

import 'package:flutter/foundation.dart';

class ReviewTvModel {
  int? id;
  int? page;
  List<ReviewTv>? reviews;
  int? totalPages;
  int? totalResults;

  ReviewTvModel({
    this.id,
    this.page,
    this.reviews,
    this.totalPages,
    this.totalResults,
  });

  ReviewTvModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    page = json['page'];
    if (json['results'] != null) {
      reviews = <ReviewTv>[];
      json['results'].forEach((v) {
        reviews!.add(new ReviewTv.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page'] = this.page;
    if (this.reviews != null) {
      data['results'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class ReviewTv {
  String? author;
  AuthorDetails? authorDetails;
  String? content;
  String? createdAt;
  dynamic id;
  String? updatedAt;
  String? url;

  ReviewTv({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  ReviewTv.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    authorDetails = json['author_details'] != null
        ? new AuthorDetails.fromJson(json['author_details'])
        : null;
    content = json['content'];
    createdAt = json['created_at'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    if (this.authorDetails != null) {
      data['author_details'] = this.authorDetails!.toJson();
    }
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    return data;
  }
}

class AuthorDetails {
  String? name;
  String? username;
  String? avatarPath;
  double? rating;

  AuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  AuthorDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    avatarPath = json['avatar_path'];
    if (kDebugMode) {
      print("Check rating");
      print(json['rating'].toString());
    }
    rating = json['rating'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['avatar_path'] = this.avatarPath;
    data['rating'] = this.rating;
    return data;
  }
}
