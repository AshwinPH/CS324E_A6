class Villager extends Cell{
 String id;
 PVector index;
 int age;
 
 Villager(String id, int x, int y, int age){
   this.id = id;
   index = new PVector(x, y);
   this.age = age;
     
 }
  
  void update(){
    
    int neighbors = 0;
    int x0, xn, y0, yn;
    x0 = -1;
    xn = 1;
    y0 = -1;
    yn = 1;
    if (int(this.index.x) == 0){
      x0 = 0;
    }
    if (int(this.index.x) == currentGrid.length-1){
      xn = 0;   
    }
    if (int(this.index.y) == 0){
      y0 = 0;
    }
    if (int(this.index.y) == currentGrid.length-1){
      yn = 0;   
    }
    
    //print(x0 + " " +xn+ " " +y0+ " " +yn);
      for (int i=int(this.index.x+x0); i<=(this.index.x+xn); i++) {
        for (int j=int(this.index.y+y0); j<=(this.index.y+yn); j++) {
          //print(i + " " + j + " ");
          if(currentGrid[i][j] == "living" && !(i == this.index.x && j == this.index.y)){
             neighbors++; 
          }
        
         }
         
         
      }
      print(neighbors + " ");
      
         if((neighbors <=1 || neighbors >= 4) && currentGrid[int(this.index.x)][int(this.index.y)] == "living"){
           futureGrid[int(this.index.x)][int(this.index.y)] = "dead";
         }
         if (neighbors == 3  && currentGrid[int(this.index.x)][int(this.index.y)] == "dead"){
           futureGrid[int(this.index.x)][int(this.index.y)] = "living";
         }
         
       
         
    }
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
