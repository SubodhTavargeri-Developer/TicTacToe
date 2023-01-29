//  Created by Subodh Tavargeri on 28/01/2023.
//  SpyData For TicTacToeView Protocol

@testable import TicTacToe

class TicTacToeViewControllerSpy: TicTacToeViewProtocol {
    
    
    var title: String?
    var playerName: String?
    
    func displayTitle(_title: String) {
        self.title = _title
    }
    
    func displayCurrentPlayerName(playerName: String) {
        self.playerName = playerName
    }
    
    func setButtonTitle(title: String) {
        self.title = title
    }
    
}
