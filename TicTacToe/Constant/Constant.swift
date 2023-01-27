struct Constant {
    
    struct Message {
        static let drawGame = "Game Ends in a Draw!!!"
        static let playerWins = "Player %@ Wins!!!"
    }
    
    struct Title {
        static let screenTitle = "Tic Tac Toe"
    }
    
    enum GameStatus {
        case running, finished, draw
    }
}
