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
        
        let _ = game.playerPlays(index: 0)
        
        let expected = playerO
        XCTAssertEqual(game.getCurrentPlayer().name,expected)
    }
    
    func test_CurrentPlayerIsSetToPlayerX_WhenGameLoads() {
        
        let expected = playerX
        XCTAssertEqual(game.getCurrentPlayer().name, expected)
    }
    
    func test_CurrentPlayerIsChangedToPlayerO_WhenPlayerXTurnIsDone() {
        
        let _ = game.playerPlays(index: 0)
        
        let expected = playerO
        XCTAssertEqual(game.getCurrentPlayer().name, expected)
    }
    
    func test_CurrentPlayerIsChangedToPlayerX_WhenPlayerOTurnIsDone() {
        
        let _ = game.playerPlays(index: 0)
        let _ = game.playerPlays(index: 1)
        
        let expected = playerX
        XCTAssertEqual(game.getCurrentPlayer().name, expected)
    }
    
    func test_NewValueIsInsertedIntoBoardArrayAtIndex_IfIndexIsEmptyAtBoardValue() {
        
        let index = 0
        
        let title = game.playerPlays(index: index).title
        
        let expected = playerX
        XCTAssertEqual(title, expected)
    }
    
    func test_NewValueIsNotInsertedIntoBoardArrayAtIndex_IfIndexIsNotEmptyAtBoardValue() {
        
        let index = 1
        
        let _ = game.playerPlays(index: index)
        let title = game.playerPlays(index: index).title
        
        XCTAssertNil(title)
    }
    
    func test_CurrentPlayerIsUpdated_WhenBoardArrayValueIsUpdated() {
        
        let index = 2
        
        let _ = game.playerPlays(index: index)
        
        let expected = playerO
        XCTAssertEqual(game.getCurrentPlayer().name, expected)
    }
    
    func test_CurrentPlayerNameIsReturned_WhenBoardArrayIndexIsEmpty() {
        
        let index = 2
        
        let originalName = game.playerPlays(index: index)
        
        let expected = playerX
        XCTAssertEqual(originalName.0, expected)
    }
    
    func test_CurrentPlayerNameIsReturnedAsO_WhenBoardArrayIndexIsEmpty() {
        
        let index = 4
        
        let _ = game.playerPlays(index: 2)
        let originalName = game.playerPlays(index: index)
        
        let expected = playerO
        XCTAssertEqual(originalName.0, expected)
    }
    
    func test_CurrentPlayerNameIsReturnedAsNil_WhenBoardArrayIndexHasValue() {
        
        let index = 2
        
        let _ = game.playerPlays(index: 2)
        let originalName = game.playerPlays(index: index).0
        
        XCTAssertNil(originalName)
    }
    
    func test_PlayerXWins_WhenAnyPlayerMatchesRules_2_4_6() {
        
        var original = ""
        let playIndex = [2,1,4,5,6]
        
        for index in 0..<playIndex.count {
            original = game.playerPlays(index: playIndex[index]).title ?? ""
        }
        
        let expecation = "Player X Wins!!!"
        XCTAssertEqual(original, expecation)
    }
    
    func test_PlayerXWins_WhenPlayerXPositionMatchesRules_0_1_2() {
        
        var original = ""
        let playIndex = [0,4,1,5,2]
        
        for index in 0..<playIndex.count {
            original = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expecation = "Player X Wins!!!"
        XCTAssertEqual(original, expecation)
    }
    
    func test_PlayerOWins_WhenPlayerOMatchesRules_3_4_5() {
        
        var original = ""
        let playIndex = [0,3,1,4,8,5]
        
        for index in 0..<playIndex.count {
            original = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expecation = "Player O Wins!!!"
        XCTAssertEqual(original, expecation)
    }
    
    func test_PlayerOWins_WhenPlayerOMatchesRules_6_7_8() {
        
        var original = ""
        let playIndex = [0,6,1,7,3,8]
        
        for index in 0..<playIndex.count {
            original = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expecation = "Player O Wins!!!"
        XCTAssertEqual(original, expecation)
    }
    
    func test_PlayerXWins_WhenPlayerXMatchesRules_0_3_6() {
        
        var original = ""
        let playIndex = [0,1,3,7,6]
        
        for index in 0..<playIndex.count {
            original = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expecation = "Player X Wins!!!"
        XCTAssertEqual(original, expecation)
    }
    
    func test_PlayerXWins_WhenPlayerXMatchesRules_1_4_7() {
        
        var original = ""
        let playIndex = [1,8,4,2,7]
        
        for index in 0..<playIndex.count {
            original = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expecation = "Player X Wins!!!"
        XCTAssertEqual(original, expecation)
    }
    
    func test_PlayerOWins_WhenPlayerOMatchesRules_2_5_8() {
        
        var original = ""
        let playIndex = [1,2,4,5,0,3,6,8]
        
        for index in 0..<playIndex.count {
            original = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expecation = "Player O Wins!!!"
        XCTAssertEqual(original, expecation)
    }
    
    func test_PlayerXWins_WhenPlayerXMatchesRules_0_4_8() {
        
        var original = ""
        let playIndex = [1,2,0,5,4,3,8]
        
        for index in 0..<playIndex.count {
            original = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expecation = "Player X Wins!!!"
        XCTAssertEqual(original, expecation)
    }
    
    func test_PlayerXWins_WhenPlayerXMatchesRules_InReverseOrder_4_8_0() {
        
        var original = ""
        let playIndex = [4,2,8,5,0]
        
        for index in 0..<playIndex.count {
            original = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expecation = "Player X Wins!!!"
        XCTAssertEqual(original, expecation)
    }
    
    
    func test_GameStatusIsDrawn_WhenThereIsNoEmptyBlockToBeFilled() {
        
        let playIndex = [0,1,2,4,7,3,5,8,6]
        
        for index in 0..<playIndex.count {
            _ = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expecation = Constant.GameStatus.draw
        XCTAssertEqual(game.getGameStatus(), expecation)
    }
    
    func test_GameStatusIsDrawn_WhenThereIsNoEmptyBlockToBeFilled_WithDifferentCombination() {
        
        let playIndex = [2,4,8,5,3,1,7,6,0]
        
        for index in 0..<playIndex.count {
            _ = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expecation = Constant.GameStatus.draw
        XCTAssertEqual(game.getGameStatus(), expecation)
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
    
    func test_GameFinishedStatusIsFinished_WhenPlayerXWins_0_1_2() {
        
        let playIndex = [0,4,1,5,2]
        
        for index in 0..<playIndex.count {
            _ = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expectation = Constant.GameStatus.finished
        XCTAssertEqual(game.getGameStatus(),expectation)
    }
    
    func test_GameFinishedStatusIsFinished_WhenPlayerXWins_InReverseOrder_4_8_0() {
        
        let playIndex = [4,2,8,5,0]
        
        for index in 0..<playIndex.count {
            _ = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expectation = Constant.GameStatus.finished
        XCTAssertEqual(game.getGameStatus(),expectation)
    }
    
    func test_GameStatusIsDraw_WhenThereIsNoEmptyBlockToBeFilled() {
        
        let playIndex = [0,1,2,4,7,3,5,8,6]
        
        for index in 0..<playIndex.count {
            _ = game.playerPlays(index: playIndex[index]).0 ?? ""
        }
        
        let expecation = Constant.GameStatus.draw
        XCTAssertEqual(game.getGameStatus(), expecation)
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
