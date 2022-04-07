class Wall {
  PVector pos;
  int index;
 
  Wall(int x, int y, int index) {
    this.pos = new PVector(x,y);
    this.index = index;  
  }

 void change(Wall[][] board, Wall[][] future) {
    for (int y = 0; y< board[0].length; y++) {
      for (int x = 0; x < board.length; x++) {
       
        int b = this.checkDestroyers(x, y, board);
        int w = this.checkBuilders(x, y, board);
        //if the cell is a wall
        if (board[x][y].index == 0) {
          if (b>= 2) {
            future[x][y].index = 1;
          }
        }
        else if(board[x][y].index == 2) {
          if (w>= 4) {
            future[x][y].index = 0;
          }
        }
        else if(board[x][y].index == 1) {
          if(w>=4) {
            future[x][y].index = 2;
          }
        }
        else {
          future[x][y] = board[x][y];
        }
      }
    }
    board = future;
  }

  int checkDestroyers(int x, int y, Wall[][] board) {
    int blackneighbors = 0;
    //int whiteneighbors = 0;
       for (int i = -1; i< 2; i++) {
         for (int j = -1; j <2; j++) {
            if (x + i <0 || x + i > (board.length -1) || y + j < 0 || y + j > board[0].length -1) {
            } else if (i ==0 && j ==0) {
            } else if(board[x+i][y+j].index == 1){
              blackneighbors++;
            }
          }
        }
      return blackneighbors;
    }
   
 
  int checkBuilders(int x, int y, Wall[][] board) {
    //int blackneighbors = 0;
    int whiteneighbors = 0;
       for (int i = -1; i< 2; i++) {
         for (int j = -1; j <2; j++) {
            if (x + i <0 || x + i > (board.length -1) || y + j < 0 || y + j > board[0].length -1) {
            } else if (i ==0 && j ==0) {
            } else if(board[x+i][y+j].index == 2){
              whiteneighbors++;
            }
          }
        }
      return whiteneighbors;
    }
}
