protocol TicTacToePresenterProtocol {
    func loadPresenter()
    func playerClickEvent(index: Int)
    func resetGame()
}

class TicTacToePresenter: TicTacToePresenterProtocol {
    
    private weak var view: TicTacToeViewProtocol?
    private let game: GameProtocol
    
    init(view: TicTacToeViewProtocol,
         game: GameProtocol) {
        self.view = view
        self.game = game
    }
    
    func loadPresenter() {
        displayTitle()
        displayCurrentPlayer()
    }


    private func displayTitle() {
        view?.displayTitle(_title: Constant.Title.screenTitle)
    }
    
    private func displayCurrentPlayer() {
        let playerName = game.getCurrentPlayer().name
        view?.displayCurrentPlayerName(playerName: "Current Player \(playerName)")
    }
    
    func playerClickEvent(index: Int) {
        
        let clickData = game.playerPlays(index: index)
        
        if let message = clickData.title {
            
            let gameStatus = clickData.gameState
            
            if gameStatus == .finished || gameStatus == .draw {
                view?.setButtonTitle(title: game.getCurrentPlayer().name)
                view?.displayCurrentPlayerName(playerName: message)
                return
            }
            
            view?.setButtonTitle(title: message)
            displayCurrentPlayer()
        }
    }
    
    func resetGame() {
        game.resetGame()
        displayCurrentPlayer()
    }
}
