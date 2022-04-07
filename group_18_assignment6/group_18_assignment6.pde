String[][] currentGrid; //[rows][columns]
String[][] futureGrid;
color livingColor = color(231,172,207);
color deadColor = color(0);
color medicColor = color(116,187,251);
color infectedColor = color(167,244,50);
color immuneColor = color(255,159,0);

int cellWidth = 10;
int cellHeight = 10;
float chanceOfLiving = 0.4;
Plague plague;

void setup(){
  frameRate(1);
  size(700,700);
  fill(0);
  rect(0,0,width,height);
  //allocate enough memory for the grid
  currentGrid = new String[width/cellWidth][height/cellHeight]; 
  futureGrid = new String[width/cellWidth][height/cellHeight];
  println(width/cellWidth, height/cellHeight);
  plague = new Plague();
  //create grid
  for (int i=0; i<width/cellWidth; i++) {
    for (int j=0; j<height/cellHeight; j++) {
      float x = random(0,1);
      String id;
      Cell cell;
      if (x<chanceOfLiving){
        id = "living";
      } else{
        id = "dead";
      }
      currentGrid[i][j] = id;
      futureGrid[i][j] = id;
      //creating cell object;
      cell = new Cell(id,i,j);
      cell.display();
      
    }
  }
  plague.start();
}


void draw(){
  //traverse all cells
   for (int i=0; i<width/cellWidth-1; i++) {
      for (int j=0; j<height/cellHeight; j++) {
        Cell cell = new Cell(currentGrid[i][j],i,j);
        if (cell.id == "infected"){
          cell.checkNeighbors(new String[] {"living"}, "infected"); //changes futureGrid
          //println("a cell got sick");
        } else if (cell.id == "medic"){
          cell.checkNeighbors(new String[] {"infected"}, "immune");; //changes futureGrid
        }
      }
    } //finished traversing cells and updating future grid
    
   //start piture
   fill(0);
   rect(0,0,width,height);
   updateGrid();
   
   noLoop();
}

void updateGrid(){
   //update currentGrid based on futureGrid
   for (int i=0; i<width/cellWidth; i++) {
    for (int j=0; j<height/cellHeight; j++) {
      currentGrid[i][j] = futureGrid[i][j];
      Villager cell = new Villager(currentGrid[i][j],i,j,0);
      cell.update();
      
      cell.display();
    }
    println();
   }
   plague.createMedic();
}
