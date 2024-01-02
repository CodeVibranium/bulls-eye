import XCTest
@testable import Bullseye
// Cmd+U to test all tests
final class BullseyeTests: XCTestCase {
    var game: Game!
    override func setUpWithError() throws {
        game = Game()
    }
    
    override func tearDownWithError() throws {
        game=nil
    }
    
    func testScorePositive(){
        
        let guess = game.target + 5;
        print("POSITIVE",guess, guess-5);
        let score = game.points(sliderValue: guess);
        XCTAssertEqual(score,95)
    }
    
    
    func testScoreNegative(){
        let guess = game.target - 5;
        print("NEGATIVE",guess, guess-5);
        let score = game.points(sliderValue: guess);
        XCTAssertEqual(score,95)
    }
  
  func testNewRound(){
    game.startNewRound(points:100)
    XCTAssertEqual(game.score,100)
    XCTAssertEqual(game.round,2)
  }
  
  func testIsGuessCorrect(){
    let guess = game.target;
    let score = game.points(sliderValue: guess);
    XCTAssertEqual(score,200)
  }
  
  func testIsGuessClose(){
    let guess = game.target - 2 ;
    let score = game.points(sliderValue: guess);
    XCTAssertEqual(score,98 + 50)
  }
  
  
  func testRestartGame(){
    game.restart()
    XCTAssertEqual(game.score, 0);
    XCTAssertEqual(game.round, 1);
  }
}
