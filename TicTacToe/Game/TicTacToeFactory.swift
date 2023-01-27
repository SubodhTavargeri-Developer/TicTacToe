import UIKit

struct TicTacToeFactory {
    static func create(router: RouterProtocol) -> TicTacToeViewController {
        let game = Game()
        guard let view = UIStoryboard(name: "StoryBoard", bundle: .main).instantiateViewController(withIdentifier: "TicTacToeViewController") as? TicTacToeViewController else {
            fatalError("Unable to Instantiate TicTacToeViewController")
        }
        
        let presenter = TicTacToePresenter(view: view, game: game)
        view.setupPresenter(_presenter: presenter)
        return view
    }
}

