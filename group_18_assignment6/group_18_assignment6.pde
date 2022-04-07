Walls c;
Walls[][] gameboard;
Walls[][] future;

void setup(){
  size(640,480);
  
  c = new Walls(0,0,0);
  gameboard = new Walls[width/10][height/10];
  future = new Walls[width/10][height/10];
  // Initialize the game board
  for (int x = 0; x < gameboard.length; x++){
    for (int y =0; y < gameboard[0].length; y++){
      gameboard[x][y] = new Walls(x, y, int(random(3)));
      future[x][y] = gameboard[x][y];
    }
  }
  drawBoard();
}

     
void draw() {
  c.change(gameboard,future);
  drawBoard();
 
}
 

void drawBoard(){
  for (int r = 0; r < gameboard.length; r++){
    for (int c = 0; c < gameboard[0].length; c++){
      if (gameboard[r][c].index == 1) {
        fill(0);
      } else if (gameboard[r][c].index == 0) {
        fill(color(255,8,8));
      } else
        fill(255);
        stroke(0);
        rect(r*10, c*10, 10, 10);
      }
     
    }
  }
