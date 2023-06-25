import 'package:flutter/services.dart';
import 'board.dart';

import 'values.dart';

class Piece {
  Tetromino type;

  Piece({required this.type});

  // 方块位置
  List<int> position = [];

  Color get color {
    return tetrominoColor[type] ?? const Color(0xFFFFFFFF);
  }
//  初始化方块，在界面的上方
  void initializePiece() {
    switch (type) {
      case Tetromino.L:
        position = [-26, -16, -6, -5];
        break;
      case Tetromino.J:
        position = [-25, -15, -5, -6];
        break;
      case Tetromino.I:
        position = [-4, -5, -6, -7];
        break;
      case Tetromino.O:
        position = [-15, -16, -5, -6];
        break;
      case Tetromino.S:
        position = [-15, -14, -6, -5];
        break;
      case Tetromino.Z:
        position = [-17, -16, -6, -5];
        break;
      case Tetromino.T:
        position = [-26, -16, -6, -15];
        break;
      default:
    }
  }
//移动操作，根据方向
  void movePiece(Direction direction) {
    switch (direction) {
      case Direction.down:
        for (int i = 0; i < position.length; i++) {
          position[i] += rowLength;
        }
        break;
      case Direction.left:
        for (int i = 0; i < position.length; i++) {
          position[i] -= 1;
        }
        break;
      case Direction.right:
        for (int i = 0; i < position.length; i++) {
          position[i] += 1;
        }
        break;
      default:
    }
  }

  int rotationState = 1;
//旋转操作
  void rotatePiece() {
    List<int> newPosition = [];

    switch (type) {
      case Tetromino.L:
        switch (rotationState) {
          case 0:
            /*
                *
                *
                * *
             */
            newPosition = [
              position[1] - rowLength,
              position[1],
              position[1] + rowLength,
              position[1] + rowLength + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 1:
            /*
              * * *
              *
             */

            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + rowLength + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 2:
            /*
                * *
                  *
                  *
            */

            newPosition = [
              position[1] + rowLength,
              position[1],
              position[1] - rowLength,
              position[1] - rowLength - 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 3:
            /*
                     *
                 * * *
            */

            newPosition = [
              position[1] - rowLength - 1,
              position[1],
              position[1] + 1,
              position[1] - 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = 0;
            }
            break;
          default:
        }
        break;
      case Tetromino.J:
        switch (rotationState) {
          case 0:
            /*
                   *
                   *
                 * *
             */
            newPosition = [
              position[1] - rowLength,
              position[1],
              position[1] + rowLength,
              position[1] + rowLength - 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 1:
            /*
                *
                * * *
             */

            newPosition = [
              position[1] - rowLength - 1,
              position[1],
              position[1] - 1,
              position[1] + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 2:
            /*
                * *
                *
                *
            */

            newPosition = [
              position[1] + rowLength,
              position[1],
              position[1] - rowLength,
              position[1] - rowLength + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 3:
            /*
                * * *
                    *
            */

            newPosition = [
              position[1] + 1,
              position[1],
              position[1] - 1,
              position[1] + rowLength + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = 0;
            }
            break;
          default:
        }
        break;
      case Tetromino.I:
        switch (rotationState) {
          case 0:
            /*
                * * * *
             */
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + 2,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 1:
            /*
                  *
                  *
                  *
                  *
             */

            newPosition = [
              position[1] - rowLength,
              position[1],
              position[1] + rowLength,
              position[1] + 2 * rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 2:
            /*
                 * * * *
            */

            newPosition = [
              position[1] + 1,
              position[1],
              position[1] - 1,
              position[1] - 2,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 3:
            /*
                  *
                  *
                  *
                  *
            */

            newPosition = [
              position[1] + rowLength,
              position[1],
              position[1] - rowLength,
              position[1] - 2 * rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = 0;
            }
            break;
          default:
        }
        break;
      case Tetromino.O:
        /*
            * *
            * *
         */
        break;

      case Tetromino.S:
        switch (rotationState) {
          case 0:
            /*
                  * *
                * *
             */
            newPosition = [
              position[1],
              position[1] + 1,
              position[1] + rowLength - 1,
              position[1] + rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 1:
            /*
                *
                * *
                  *
             */

            newPosition = [
              position[0] - rowLength,
              position[0],
              position[0] + 1,
              position[0] + rowLength + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 2:
            /*
                  * *
                * *
             */

            newPosition = [
              position[1],
              position[1] + 1,
              position[1] + rowLength - 1,
              position[1] + rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 3:
            /*
                *
                * *
                  *
             */

            newPosition = [
              position[0] + rowLength,
              position[0],
              position[0] + 1,
              position[0] + rowLength + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = 0;
            }
            break;
          default:
        }
        break;

      case Tetromino.Z:
        switch (rotationState) {
          case 0:
            /*
                * *
                  * *
             */
            newPosition = [
              position[0] + rowLength - 2,
              position[1],
              position[2] + rowLength - 1,
              position[3] + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 1:
            /*
                    *
                  * *
                  *
             */

            newPosition = [
              position[0] - rowLength + 2,
              position[1],
              position[2] - rowLength + 1,
              position[3] - 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 2:
            /*
                * *
                  * *
             */

            newPosition = [
              position[0] + rowLength - 2,
              position[1],
              position[2] + rowLength - 1,
              position[3] + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 3:
            /*
                    *
                  * *
                  *
             */
            newPosition = [
              position[0] - rowLength + 2,
              position[1],
              position[2] - rowLength + 1,
              position[3] - 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = 0;
            }
            break;
          default:
        }
        break;
      case Tetromino.T:
        switch (rotationState) {
          case 0:
            /*
                  *
                  * *
                  *
             */
            newPosition = [
              position[2] - rowLength,
              position[2],
              position[2] + 1,
              position[2] + rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 1:
            /*
                * * *
                  *
             */

            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 2:
            /*
                  *
                * *
                  *
             */

            newPosition = [
              position[1] - rowLength,
              position[1] - 1,
              position[1],
              position[1] + rowLength,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 3:
            /*
                    *
                  * * *
             */
            newPosition = [
              position[2] - rowLength,
              position[2] - 1,
              position[2],
              position[2] + 1,
            ];
            if (piecePositionIsValid(newPosition)) {
              position = newPosition;
              rotationState = 0;
            }
            break;
          default:
        }
        break;

      default:
    }
  }
//方块与方块之间位置是否合法，即方块能搭在另一个方块上面
  bool positionIsValid(int position) {
    int row = (position / rowLength).floor();
    int col = position % rowLength;

    if (row < 0 || col < 0 || gameBoard[row][col] != null) {
      return false;
    }
    return true;
  }

  bool piecePositionIsValid(List<int> piecePosition) {
    bool firstColOccupied = false;
    bool lastColOccupied = false;

    for (var position in piecePosition) {
      if (!positionIsValid(position)) {
        return false;
      }

      int col = position % rowLength;

      if (col == 0) {
        firstColOccupied = true;
      }

      if (col == rowLength - 1) {
        lastColOccupied = true;
      }
    }
    return !(firstColOccupied && lastColOccupied);
  }
}
