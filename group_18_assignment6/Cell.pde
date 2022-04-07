class Cell{
  String id;
  PVector index;
  Cell(String id, int x, int y){
    this.id = id;
    index = new PVector(x,y);
  }
  Cell(){
   this.id = "null";
   index = new PVector(0,0);
  }
  // checkNeighbors looks at all the neighbors of the cell 
  // if any of these neighbors has an id in the passed in String[] changeFrom
  // their id will get changed to the id passed in as changeTo
  void checkNeighbors(String[] changeFrom, String changeTo){
    //check that we are within bounds
    if (this.index.x>0 && this.index.x<width/cellWidth-1 && this.index.y>0 && this.index.y<height/cellHeight-1){
     //iterate through neighbors
     for (int i=int(this.index.x-1); i<(this.index.y+2); i++) {
      for (int j=int(this.index.x-1); j<(this.index.y+2); j++) {
        // now iterate through String[] changeFrom 
        for (int k=0; k<changeFrom.length; k++){
           if (currentGrid[i][j] == changeFrom[k] && !(i == this.index.x && j == this.index.y)){
             futureGrid[i][j] = changeTo;
           }
        }
       }
      }
    }//ends if clause
  }//ends checkNeighbors
  
   
  
  void display(){
    float xpos = this.index.x * cellWidth;
    float  ypos = this.index.y * cellHeight;
    rectMode(CORNER);
    if (this.id == "living"){
      fill(livingColor);
    } else if (this.id == "dead"){
      fill(deadColor);
    } else if (this.id == "infected"){
      fill(infectedColor);
    } else if (this.id == "medic"){
      fill(medicColor);
    }  else if (this.id == "immune"){
      fill(immuneColor);
    }
    
     rect(xpos,ypos, cellWidth,cellHeight);
     
     
  }
}
