@testable import TicTacToe

class GameSpy: GameProtocol {
    func playerPlays(index: Int) -> (title: String?, gameState: Constant.GameStatus) {
        return (index == 1) ? ("Player O Wins!!!",.finished) : (Constant.Message.drawGame,.draw)
    }
    
  
    var gameStatus: Constant.GameStatus = .finished
    
    func getGameStatus() -> Constant.GameStatus {
        return .finished
    }
    
    func getCurrentPlayer() -> Player {
        return Player(name: "X")
    }
    
    func resetGame() {
        gameStatus = .running
    }
}
