class celPos {
  //=================fields======================\\
  float moonPhase; //Dirived from index, phase to number for calc by Tide
  float sunPhase;  
  int moonIndex; //Current phase in Array (if full moon, is moonPhaseList[5])
  int sunIndex;  //Current phase in Array (if Noon its sunPhaseList[3])
  String moonI2P; // String text of the phase of moon phase
  String sunI2P;
  String[] moonPhaseList = {"New", "Waxing Crescent", "First Quarter", "Waxing Gibbous", "Full", "Waning Gibbous", "Last Quarter", "Waning Crescent"};
  String[] sunPhaseList = {"Morning", "Noon", "Evening", "Night"};
  float gravEft;
  Environment env;
  
  //====================constructor===================\\
  celPos(){
    this.moonI2P = moonPhaseList[moonIndex];
    this.sunI2P = sunPhaseList[sunIndex];
    this.moonIndex = 0; // to start at index 0 which is a new moon
    this.sunIndex = 0;
    this.gravEft = 0;
  }

    //================Methods=================\\
    void indexToPhase(){         //moon phase to int convertion
     if ( moonI2P.equals("New") ){       //We need to make the moon phase to a controlled number where the environmentclass can acc work with it.
       this.moonPhase = 0.0;
     }
     else if ( moonI2P.equals("Waxing Crescent") ){
       this.moonPhase = 0.25;
     }
     else if ( moonI2P.equals("First Quarter") ){
       this.moonPhase = 0.5;
     }
     else if ( moonI2P.equals("Waxing Gibbous") ){
       this.moonPhase = 0.75;
     }
     else if ( moonI2P.equals("Full") ){
       this.moonPhase = 1;
     }
     else if ( moonI2P.equals("Waning Gibbous") ){
       this.moonPhase = 0.75;
     }
     else if ( moonI2P.equals("Last Quarter") ){
       this.moonPhase = 0.5;
     }
     else if ( moonI2P.equals("Waning Crescent") ){
       this.moonPhase = 0.25;
     }
     
     if (sunI2P.equals("Morning")){      //sun phase to int converter
       this.sunPhase = 0.0;
     }
     else if (sunI2P.equals("Noon")){
       this.sunPhase = 0.333;
     }
     else if (sunI2P.equals("Evening")){
       this.sunPhase = 0.666;
     }
     else if (sunI2P.equals("Night")){
       this.sunPhase = 1.0;
     }
    }
  
  void updateMoonPos(){ // to push the next phase(sunIndex moonIndex) for both sun and moon
  
    this.moonIndex++; // move to next moon phase
    
    //pusign the next moon phase
    if (this.moonIndex >= moonPhaseList.length) {
      this.moonIndex = 0; // wrap around  
    }
    
    //update the moon and sun I2P (text) moon/sunIndex has alr updated
    this.moonI2P = moonPhaseList[moonIndex]; //moonINdex is a integer array, while the moonI2P is a String.
  }
  
  void updateSunPos(){
    
    this.sunIndex++; // move to the next sun phase
    
    //pushing the next sunphase
    if(this.sunIndex >= sunPhaseList.length) {
      this.sunIndex = 0; // wraps around so we dont go out of bounds of the array 
    }
    
  //update the moon and sun I2P (text) moon/sunIndex has alr updated
    this.sunI2P = sunPhaseList[sunIndex];
  }
  
  void calcGrav() { // the moon has more effect on tide than the sun because the moon is more closer to the earth than the sun. We can scale the moonPhase(the numebr used in calc. made from
                    // moonIndext and moonPhaseList.) by 0.6 or 60% and the sun by 0.4 or 40%, as the moon has a larger effect on the tide.
                    // we than add teh windEft from the enviroment class to make the full effect on the base tide. 
                    // *IMPORTANT* this numb can get high so we need to scale the whole thing down so it doent have a big effect on the tide. IN irl wind doesnt effect the tide that much.
                    // we can do this by dividing the whole thing by 10
   
    this.gravEft = ((this.moonPhase * 0.6 + this.sunPhase * 0.4) + env.windEft) / 10 ;
  }
  
  void describeCelPos(){
    println("Moon Phase: " + moonI2P + " (" + moonPhase + ")");
    println("Sun Phase: " + sunI2P + " (" + sunPhase + ")");
  }
}
