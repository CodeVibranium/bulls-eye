import Foundation


struct Game {
  var target: Int = Int.random(in: 1...100);
  var score: Int = 0;
  var round: Int = 1;
  
  func points(sliderValue:Int)-> Int{
    let points = abs(target - sliderValue);
    var maxScore = 100;
    if(points == 0) { maxScore+=100;}
    else if(points <= 2) {maxScore+=50;}
    return maxScore - points;
  }
  
  mutating func startNewRound(points:Int){
    score+=points;
    round+=1;
    target = Int.random(in: 1...100);
  }
  
  mutating func restart(){
    target = Int.random(in: 1...100);
    score = 0;
    round = 1;
   
  }
}
