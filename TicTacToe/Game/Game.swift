protocol GameProtocol {
    func playerPlays(index: Int)-> (title: String?,gameState: Constant.GameStatus)
    func getCurrentPlayer()-> Player
    func getGameStatus()-> Constant.GameStatus
    func resetGame()
}

class Game: GameProtocol {
    
    private var playerX: Player
    private var playerO: Player
    private var currentPlayer: Player
    private var boardArray = [String]()
    private var gameStatus: Constant.GameStatus = .running
    
    private enum Postions: Int {
        case topLeft = 0,
             topCentre = 1,
             topRight = 2,
             middleLeft = 3,
             middleCentre = 4,
             middleRight = 5,
             bottomLeft = 6,
             bottomCentre = 7,
             bottomRight = 8
    }
    
    private let winningRules = [
        [Postions.topLeft.rawValue,Postions.topCentre.rawValue,Postions.topRight.rawValue],[Postions.middleLeft.rawValue,Postions.middleCentre.rawValue,Postions.middleRight.rawValue],
        [Postions.bottomLeft.rawValue,Postions.bottomCentre.rawValue,Postions.bottomRight.rawValue],[Postions.topLeft.rawValue,Postions.middleLeft.rawValue,Postions.bottomLeft.rawValue],
        [Postions.topCentre.rawValue,Postions.middleCentre.rawValue,Postions.bottomCentre.rawValue],[Postions.topRight.rawValue,Postions.middleRight.rawValue,Postions.bottomRight.rawValue],
        [Postions.topLeft.rawValue,Postions.middleCentre.rawValue,Postions.bottomRight.rawValue],[Postions.topRight.rawValue,Postions.middleCentre.rawValue,Postions.bottomLeft.rawValue]
    ]
    
    
    init() {
        playerX = Player(name: "X")
        playerO = Player(name: "O")
        currentPlayer = playerX
        setUpBoardArray()
    }
    
    private func setUpBoardArray() {
        for _ in 1...9 {
            boardArray.append("")
        }
    }
    
    private func insertIntoBoardArray(index: Int) {
        boardArray[index] = currentPlayer.name
    }
    
    func playerPlays(index: Int)-> (title: String?,gameState: Constant.GameStatus) {
        
        if boardArray[index].isEmpty && gameStatus == .running {
            insertIntoBoardArray(index: index)
            
            gameStatus = computeGameStatus()
            switch gameStatus {
            case .running:
                currentPlayer = (currentPlayer == playerX) ? playerO : playerX
                return (boardArray[index],gameStatus)
            case .finished:
                return (winningMessage(),gameStatus)
            case .draw:
                return (Constant.Message.drawGame,gameStatus)
            }
        }
        return (nil,gameStatus)
    }
    
    private func winningMessage() -> String {
        let message = String(format: Constant.Message.playerWins, arguments: [currentPlayer.name])
        return message
    }
    
    private func computeGameStatus()-> Constant.GameStatus {
        
        for rule in winningRules {
            let playerPositionAsPerRule0 = boardArray[rule[0]]
            let playerPositionAsPerRule1 = boardArray[rule[1]]
            let playerPositionAsPerRule2 = boardArray[rule[2]]
            
            if checkForWinCondition(playerPositionIndex0: playerPositionAsPerRule0,
                                    playerPositionIndex1: playerPositionAsPerRule1,
                                    playerPositionIndex2: playerPositionAsPerRule2) {
                return .finished
            }
        }
        
        if checkForDrawCondition() {
            return .draw
        }
        return .running
    }
    
    private func checkForDrawCondition()-> Bool {
        return !boardArray.contains("")
    }
    
    private func setGameStatus(status: Constant.GameStatus) {
        gameStatus = status
    }
    private func checkForWinCondition(playerPositionIndex0: String,
                                      playerPositionIndex1: String,
                                      playerPositionIndex2: String)-> Bool {
        
        if playerPositionIndex0 == playerPositionIndex1 &&
            playerPositionIndex2 == playerPositionIndex1 && !playerPositionIndex0.isEmpty {
            return true
        }
        return false
    }
    
    func getCurrentPlayer()-> Player {
        return currentPlayer
    }
    
    func getGameStatus()-> Constant.GameStatus {
        return gameStatus
    }
    
    func resetGame() {
        boardArray.removeAll()
        setGameStatus(status: .running)
        currentPlayer = playerX
        setUpBoardArray()
    }
}
