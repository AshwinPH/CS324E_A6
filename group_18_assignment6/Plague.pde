class Plague{
  Cell medic, spreader;
  
  Plague(){
    this.spreader = new Cell("infected",20, 20);
  }
  
 void start(){
   currentGrid[int(spreader.index.x)][int(spreader.index.y)] = "infected";
   spreader.display();
 }
 
 void createMedic(){
    medic = new Cell("medic",int(random(1, width/cellWidth-1)), int(random(1, height/cellHeight-1)));
    currentGrid[int(medic.index.x)][int(medic.index.y)] = "medic";
    medic.display();
 }
 
}
