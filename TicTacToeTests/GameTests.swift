//  Created by Subodh Tavargeri

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    let game = Game()
    let playerX = "X"
    let playerO = "O"
    
    func test_PlayerXNameIsSet_WhenGameLoads() {
        
        let expected = playerX
        XCTAssertEqual(game.getCurrentPlayer().name,expected)
    }
    
    func test_PlayerONameIsSet_WhenPlayerXTurnIsFinished() {
        
        let _ = game.playerPlays(position: Position.bottomCentre) { _ in
            
        }
        
        let expected = playerO
        XCTAssertEqual(game.getCurrentPlayer().name,expected)
    }
    
    func test_CurrentPlayerIsSetToPlayerX_WhenGameLoads() {
        
        let expected = playerX
        XCTAssertEqual(game.getCurrentPlayer().name, expected)
    }
    
    func test_CurrentPlayerIsChangedToPlayerO_WhenPlayerXTurnIsDone() {
        
        let _ = game.playerPlays(position: Position.bottomLeft) { _ in
        }
        
        let expected = playerO
        XCTAssertEqual(game.getCurrentPlayer().name, expected)
    }
    
    func test_CurrentPlayerIsChangedToPlayerX_WhenPlayerOTurnIsDone() {
        
        let _ = game.playerPlays(position: Position.bottomCentre) { _ in
            
        }
        
        let expected = playerO
        XCTAssertEqual(game.getCurrentPlayer().name, expected)
    }
    
    func test_CurrentPlayerIsSetToPlayerXName_WhenGameLoads() {
        
        let original = game.getCurrentPlayer().name
        
        let expectation = playerX
        XCTAssertEqual(original, expectation)
    }
    
    func test_GameFinishedIsRunning_WhenGameLoads() {
        
        let expectation = Constant.GameStatus.running
        XCTAssertEqual(game.getGameStatus(),expectation)
    }

    func test_GameStatusIsResetToRunning_WhenGameIsReset() {
        
        game.resetGame()
        
        XCTAssertEqual(game.getGameStatus(), .running)
    }
    
    
    func test_CurrentPlayerIsResetToX_WhenGameIsReset() {
        
        game.resetGame()
        
        XCTAssertEqual(game.getCurrentPlayer().name, "X")
    }
}
