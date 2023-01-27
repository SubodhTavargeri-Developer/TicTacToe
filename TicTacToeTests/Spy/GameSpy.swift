@testable import TicTacToe

class GameSpy: GameProtocol {
    func playerPlays(position: TicTacToe.Position, positionFillCompletion: (Bool) -> Void) {
        return positionFillCompletion(true)
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
