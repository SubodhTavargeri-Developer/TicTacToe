//  Created by Subodh Tavargeri on 28/01/2023.
//  SpyData For Game Protocol

@testable import TicTacToe

class GameSpy: GameProtocol {
    
    var gameStatus: Constant.GameStatus = .finished
    
    func playerPlays(position: TicTacToe.Position, positionFillCompletion: (Bool) -> Void) {
        return positionFillCompletion(true)
    }
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
