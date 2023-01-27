protocol GameProtocol {
    func playerPlays(position: Position, positionFillCompletion: (Bool) -> Void)
    func getCurrentPlayer()-> Player
    func getGameStatus()-> Constant.GameStatus
    func resetGame()
}

enum Position: Int {
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

class Game: GameProtocol {
    
    private let playerX: Player
    private let playerO: Player
    private var currentPlayer: Player
    private var boardArray = [String]()
    private var gameStatus: Constant.GameStatus = .running
    
    //Winning Position Rules
    private let winningRules = [
        [Position.topLeft, Position.topCentre, Position.topRight],
        [Position.middleLeft, Position.middleCentre, Position.middleRight],
        [Position.bottomLeft, Position.bottomCentre, Position.bottomRight],
        [Position.topLeft, Position.middleLeft, Position.bottomLeft],
        [Position.topCentre, Position.middleCentre, Position.bottomCentre],
        [Position.topRight, Position.middleRight, Position.bottomRight],
        [Position.topLeft, Position.middleCentre, Position.bottomRight],
        [Position.topRight, Position.middleCentre, Position.bottomLeft]
    ]
    
    
    init() {
        playerX = Player(name: "X")
        playerO = Player(name: "O")
        currentPlayer = playerX
        setUpBoardArray()
    }
    
    /// Calculate OneHourLightRow
    /// - Parameters:
    ///  - position: Player Position
    /// - positionFillCompletion: Handler once player finishes playing
    func playerPlays(position: Position,
                     positionFillCompletion: (Bool) -> Void) {
        if isBoardPositionEmpty(position) && gameStatus.isRunning() {
            updateGame(position)
            positionFillCompletion(true)
        }
        
        positionFillCompletion(false)
    }
    
    /// Get Current Player
    /// - Returns: PlayerName
    func getCurrentPlayer()-> Player {
        return currentPlayer
    }
    
    /// Get Current GameStatus
    /// - Returns: GameStatus
    func getGameStatus()-> Constant.GameStatus {
        return gameStatus
    }
    
    func resetGame() {
        boardArray.removeAll()
        gameStatus = .running
        currentPlayer = playerX
        setUpBoardArray()
    }
    
    private func updateGame(_ position: Position) {
        boardArray[position.rawValue] = currentPlayer.name
        gameStatus = computeGameStatus()
        
        if gameStatus.isRunning() {
            currentPlayer = (currentPlayer == playerX) ? playerO : playerX
        }
    }
    
    private func computeGameStatus() -> Constant.GameStatus {
        for rule in winningRules {
            if isWinningRuleSatisfied(rule: rule) {
                return .finished
            }
        }
        
        if checkForDrawCondition() {
            return .draw
        }
        
        return .running
    }
    
    private func isWinningRuleSatisfied(rule: [Position]) -> Bool {
        boardArray[rule[0].rawValue] == currentPlayer.name
        && boardArray[rule[1].rawValue] == currentPlayer.name
        && boardArray[rule[2].rawValue] == currentPlayer.name
    }
    
    private func checkForDrawCondition() -> Bool {
        return !boardArray.contains("")
    }
    
    private func setUpBoardArray() {
        for _ in 1...9 {
            boardArray.append("")
        }
    }
    
    private func isBoardPositionEmpty(_ positionIndex: Position) -> Bool {
        boardArray[positionIndex.rawValue].isEmpty
    }
}

