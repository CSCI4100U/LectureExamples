// CSCI 4100U - 12 - Game Development

import 'dart:ui';

import 'package:flutter/painting.dart';

import 'package:flame/sprite.dart';

class Tile {
  static const double MAX_X_OFFSET = 18.0;

  Size screenSize;
  double tileSize;
  String image;
  double xOffset = 0;
  double yOffset = 0;
  double xSize = 1;
  double ySize = 1;
  double xSpeed = 0;
  double ySpeed = 0;

  Rect rect;
  Sprite sprite;

  Tile({this.screenSize, this.tileSize,
        this.xOffset,    this.yOffset,
        this.xSpeed = 4, this.ySpeed = 0,
        this.image}) {
    
    this.xSize = this.tileSize;
    this.ySize = this.tileSize;

    rect = Rect.fromLTWH(toScreenX(xOffset), toScreenY(yOffset), xSize, ySize);

    sprite = Sprite(image);
  }

  double toScreenX(double x) {
    return x * tileSize;
  }

  double toScreenY(double y) {
    return 370.0 - (y * tileSize);
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  bool update(double dt) {
    xOffset -= xSpeed * dt;
    yOffset -= ySpeed * dt;

    // check if this tile is off the screen
    if (xOffset < -1) {
      // position it to the right
      xOffset = MAX_X_OFFSET + 2;
    }

    // convert to screen coordinates
    double xPixelOffset = toScreenX(xOffset);
    double yPixelOffset = toScreenY(yOffset);
    rect = Rect.fromLTWH(xPixelOffset, yPixelOffset, xSize, ySize);

    return false;
  }
}