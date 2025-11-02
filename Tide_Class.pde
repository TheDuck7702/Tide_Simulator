class Tide {
    //=================fields======================\\
  float seaLvl;
  float tideLvl;
  String tideType;
  float highestLvl;
  float lowestLvl;
  boolean good4Swimming;
  boolean highOrLow; // high meaning tru low meaning false
  ArrayList<String> tideHist;
  Environment env;
  celPos c;
  
  //====================constructor===================\\
  
  Tide() {
   this.seaLvl = 0;
   this.tideLvl = 0;
   this.highestLvl = 1.5;
   this.lowestLvl = -1.5;
   this.highOrLow = true;
   this.good4Swimming = true;
   this.tideHist = new ArrayList<>();
  }
  
  //================Methods=================\\
  void updateLevel(celPos c, Environment env) {
    //discription of the calc: we convert moon and sun phases to a value. The bigger the value the bigger the tide is.
    //                         We also know that the moon has a bigger influance than the sun. So we can weight the moon(moon 0.6 sun 0.4) more
    //                         we than muliply the value by the wind influance, as wind can amplify or reduce the tide. 
    //                         This value can tell use if its low or high tide, and how big is it.
    //                         Acc update on Nov 1, its better if we use a sine wave to modle these if u look at any tide tracker 
    //                         ex. https://www.tide-forecast.com/locations/Albany-New-York/tides/latest
    //                         its very similer to a sine wave. Modleing it will be hard as im not even done the 3ed unit of grade 11 funtions so i better start watching yt vids.
    
    // Sine wave notes:  y = a * sin(b*(x-c)) + d
    // a = amplitude  (max height)
    // b = frequency  (TWO_PI / period) how fast or commen 
    // c = horazontal shift
    // d = vertical shift
    // x = env.hour
    //when playing in desmos i saw that when u change c its teh horazontal and when u change d is the vertical. 
    //TWO_PI i found it in the persosn class in the tsinami sim in the OOP disign projects. it just a constant that eqals 2*pi we need thos as prossesing use radiens nor degrees 
   
    float baseAmplitude = 1.5;
    
    float period = 12.0;       // hours for every 12 hour tide

    float amp = baseAmplitude * (0.5 + 0.5 * c.moonPhase);     // Scale amp by the moon phase. We need to do this as the moon phase changes the amp every 24 hours or 1 day

    // radians
    float phaseShift = c.moonPhase * TWO_PI;

    // Wind eff
    float verticalShift = env.windEft;

    this.tideLvl = amp * sin(TWO_PI * env.hour / period + phaseShift) + verticalShift;
  }
  
  void updateRecord(){
    //I want to return a table of at this hour, moon phase or tide level it owuld make a table of all that.
    //I also want a addional info sect. here i will write the record highest and lowest tide.
    //In this class I will check all the heights and pick out the very higher and lowest tide.
    
    //highest finder
    if(this.tideLvl > this.highestLvl){
      this.highestLvl = this.tideLvl;
    }
    
    //lowest finder
    if(this.tideLvl < this.lowestLvl){
      this.lowestLvl = this.tideLvl;
    }
  }
  
  void updateG4S() {
    if(this.tideLvl > 1.5 || this.tideLvl < 0.3){   //the || means or  
      this.good4Swimming = false;
    }
    else{
     this.good4Swimming = true; 
    }
  }
  
  void updateHighOrLow( Environment env, celPos c) {
    //to find if its high or low we check 1, the moon phase and 2, the time. the moon phase is responable for making the tides so in full and new moons are more stronger. 
    //the other part, the time is uses as tiem changes alot during the day. this change can be catagorised into teh first half of the day, and  the last half. The code just checks the time by converting the 24 horu clock to 12 hours.
    
 //New and full moon
    if( c.moonI2P.equals("New") || c.moonI2P.equals("Full")){
      if(env.hour % 12 < 6) { //give the current hour in the 12 hour cycle (24 hour to am/pm time)
        this.highOrLow = false; //low
      }
      else{
        this.highOrLow = true; // high
      }
    }
    
    //first and last quarter
    else if(c.moonI2P.equals("First Quarter") || c.moonI2P.equals("Last Quarter")){
      if(env.hour % 12 < 6){
        this.highOrLow = true;
      }
      else{
        this.highOrLow = false;
      }
    }
    
    // last 4 moon phases
    else{
     if(env.hour % 12 < 6){
       this.highOrLow = false;
     }
     else{
       this.highOrLow = true;
      }
    }
    
  }
  
  void updateTideHist(celPos c, Environment env){
    //this method keeps track fo the history of the tide. if we did not have this, the str var of tideLvl will be overwritten every calc
    //to solve this we added a arraylist so we can return a cool table of all the info.
    //To do this we need to make a local var for a String that has all of info in it than add it to the array list
    //used in debugging
    
    String recordHist =
    "day: " + env.day +
    "Hour: " + env.hour +
    "moon phase" + c.moonPhase +
    "sun Phase" + c.sunPhase +
    "tide level" + this.tideLvl +
    "wind effect" + env.windEft +
    "high or low tide" + this.highOrLow +
    "good for swimming?" + this.good4Swimming;
    //wow so organized
    
    //to add str to the arraylist
    this.tideHist.add(recordHist);
    
  }
}
