//  Created by Subodh Tavargeri on 28/01/2023.
//  TestCase for GamePresenter

import XCTest
@testable import TicTacToe

class TicTacToePresenterTests: XCTestCase {
    
    let view = TicTacToeViewControllerSpy()
    let game = GameSpy()
    var presenter:TicTacToePresenter?
    
    override func setUp()  {
        presenter = TicTacToePresenter(view: view, game: game)
    }
    
    func test_ViewTitleIsSet_WhenPresenterLoads() {
        
        presenter?.loadPresenter()
        
        let expectation = Constant.Title.screenTitle
        XCTAssertEqual(view.title, expectation)
    }
    
    func test_CurrentPlayerNameIsSetToX_WhenGameLoads() {
        
        presenter?.loadPresenter()
        
        let expecation = "Current Player X"
        XCTAssertEqual(view.playerName, expecation)
    }
    
    func test_CurrentPlayerNameIsSetToO_WhenPlayerXFinishesPlaying() {
        
        presenter?.playerClickEvent(position: 1)
        
        let expecation = "Player X Wins!!!"
        XCTAssertEqual(view.playerName, expecation)
    }
    
    func test_PlayerXWinsMessageIsDisplayed_WhenPlayerXWinsGame() {
        
        presenter?.playerClickEvent(position: 1)
        
        let expecation = "Player X Wins!!!"
        XCTAssertEqual(view.playerName, expecation)
    }
    
    func test_GameDrawMessageIsDisplayed_WhenGameEndsInDraw() {
        
        presenter?.playerClickEvent(position: 0)
        
        let expecation = "Player X Wins!!!"
        XCTAssertEqual(view.playerName, expecation)
    }
    
    func test_GameStatusIsRunning_WhenGameIsReset() {
        
        presenter?.resetGame()
        
        XCTAssertEqual(game.gameStatus,.running)
    }
    
    func test_CurrentPlayerNameIsSetToX_WhenGameIsReset() {
        
        presenter?.resetGame()
        
        let expecation = "Current Player X"
        XCTAssertEqual(view.playerName, expecation)
    }
}
