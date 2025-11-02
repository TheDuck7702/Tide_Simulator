  class Environment {
  //=================fields======================\\
  float day;
  float hour;
  String windType;
  float windEft;
  int frameTrack;
  
  //====================constructor===================\\ 
  Environment(float D, float H, String WT, float WE ) {
    this.day = D;
    this.hour = H;
    this.windType = WT;
    this.windEft = WE;
    this.frameTrack = 0;
   }
  
  //================Methods=================\\
  void updateTime() {
    this.frameTrack = this.frameTrack + 1;
    
    //every 60 sec (60 frames) = 1 similated hour
    if (this.frameTrack >= 60){
      this.frameTrack = 0;    //to reset the frameCount(sec) timer
      this.hour += 1;         //to add one to the hour ver
    }
    
    //every 24 hours (1 day), reset the counter and start a new day
    if(this.hour >= 24){
      this.hour = 0;   //reset the hour
      this.day += 1;   //add one to the day
    }
   }
  
  void randWind() {
    int randNum = int(random(0,5));
    
    if(randNum == 0){
      this.windType = "Calm";
      this.windEft = random(-0.5,0.5);
    }
    if(randNum == 1){  
      this.windType = "Breeze";
      this.windEft = random(-0.5,0.5);
    }
    if(randNum == 2){
      this.windType = "Windy";
      this.windEft = random(-0.5,0.5);
    }
    if(randNum == 3){
      this.windType = "Strong Gales";
      this.windEft = random(-0.5,0.5);
    }
    if(randNum == 4){
      this.windType = "Extream Winds";
      this.windEft = random(-0.5,0.5);
    }
  }
  
  void describeEnv() {
    println("Time Info: Day:", this.day, "Hour:", this.hour);
    //used in debugging
  }
}
