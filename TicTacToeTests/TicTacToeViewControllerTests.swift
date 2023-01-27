import XCTest
@testable import TicTacToe

class TicTacToeViewControllerTests: XCTestCase {
    
    var view: TicTacToeViewController?
    
    override func setUp() {
        
        guard let controller = UIStoryboard(name: "StoryBoard", bundle: .main).instantiateViewController(withIdentifier: "TicTacToeViewController") as? TicTacToeViewController else {
            fatalError("Unable to Instantiate TicTacToeViewController")
        }
        
        self.view = controller
        let presenter = TicTacToePresenterSpy()
        view?.setupPresenter(_presenter: presenter)
        _ = self.view?.view
    }
    
    func test_ViewTitleIsSet_WhenViewLoads() {
        
        view?.displayTitle(_title: Constant.Title.screenTitle)
        
        let expectation = Constant.Title.screenTitle
        XCTAssertEqual(view?.title, expectation)
    }
    
    func test_CurrentPlayerLabelIsDisplayed_WhenCurrentPlayerIsVisible() {
        
        view?.displayCurrentPlayerName(playerName: "X")
        
        let expectation = "X"
        XCTAssertEqual(view?.labelCurrentPlayer.text, expectation)
    }
    
    func test_PlayerButtonTitleIsSet_WhenPlayerClicksOnButton() {
        
        view?.buttonAction(UIButton())
        
        view?.setButtonTitle(title: "X")
        let orginal = view?.senderButton?.title(for: .normal)
        
        let expectation = "X"
        XCTAssertEqual(orginal, expectation)
    }
    
    func test_PlayerNameXIsDisplayed_WhenCurrentPlayerNameIsSet() {
        
        view?.displayCurrentPlayerName(playerName: "X")
        
        let expectation = "X"
        XCTAssertEqual(view?.labelCurrentPlayer.text, expectation)
    }
    
    func test_CurrentPlayerLabelIsResetTo_PlayerNameX_WhenButtonResetIsPressed() {
        
        view?.resetGame()
        view?.displayCurrentPlayerName(playerName: "X")
        
        let expectation = "X"
        XCTAssertEqual(view?.labelCurrentPlayer.text, expectation)
    }
    
}
