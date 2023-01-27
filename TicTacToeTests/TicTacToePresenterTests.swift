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
        
        presenter?.playerClickEvent(index: 1)
        
        let expecation = "Player O Wins!!!"
        XCTAssertEqual(view.playerName, expecation)
    }
    
    func test_PlayerXWinsMessageIsDisplayed_WhenPlayerXWinsGame() {
        
        presenter?.playerClickEvent(index: 1)
        
        let expecation = "Player O Wins!!!"
        XCTAssertEqual(view.playerName, expecation)
    }
    
    func test_GameDrawMessageIsDisplayed_WhenGameEndsInDraw() {
        
        presenter?.playerClickEvent(index: 0)
        
        let expecation = Constant.Message.drawGame
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
