protocol TicTacToePresenterProtocol {
    func loadPresenter()
    func playerClickEvent(position: Int)
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
    
    func playerClickEvent(position: Int) {
        guard let position = Position(rawValue: position) else {
            return
        }
        
        let playedPlayer = game.getCurrentPlayer()
        
        game.playerPlays(position: position) { isPositionFillSuccess in
            if isPositionFillSuccess {
                updateView(playedPlayer: playedPlayer)
            }
        }
    }
    
    func resetGame() {
        game.resetGame()
        displayCurrentPlayer()
    }
    
    private func updateView(playedPlayer: Player) {
        let gameStatus = game.getGameStatus()
        view?.setButtonTitle(title: playedPlayer.name)
        
        if gameStatus == .finished {
            view?.displayCurrentPlayerName(playerName: buildGameFinsihedText())
            return
        }
        
        if gameStatus == .draw {
            view?.displayCurrentPlayerName(playerName: Constant.Message.drawGame)
            return
        }
        
        displayCurrentPlayer()
    }
    
    private func buildGameFinsihedText() -> String {
        let message = String(format: Constant.Message.playerWins, arguments: [game.getCurrentPlayer().name])
        return message
    }
    
    private func displayTitle() {
        view?.displayTitle(_title: Constant.Title.screenTitle)
    }
    
    private func displayCurrentPlayer() {
        let playerName = game.getCurrentPlayer().name
        view?.displayCurrentPlayerName(playerName: "Current Player \(playerName)")
    }
}
