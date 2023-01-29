//  Created by Subodh Tavargeri on 28/01/2023.
//  ViewController to display TicTacToeGame UI

import UIKit

protocol TicTacToeViewProtocol: AnyObject {
    func displayTitle(_title: ScreenTitle)
    func displayCurrentPlayerName(playerName: PlayerName)
    func setButtonTitle(title: String)
}

class TicTacToeViewController: UIViewController {
    
    @IBOutlet var buttonBoxes: [UIButton]!
    @IBOutlet weak var labelCurrentPlayer: UILabel!
    
    var presenter: TicTacToePresenterProtocol?
    private (set) var senderButton: UIButton?
    
    func setupPresenter(_presenter: TicTacToePresenterProtocol) {
        self.presenter = _presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadPresenter()
        buttonBoxes.forEach {
            $0.setTitle("", for: .normal)
        }
    }
    
    //  When user clicks on Any of the box
    @IBAction func buttonAction(_ sender: UIButton) {
        senderButton = sender
        presenter?.playerClickEvent(position: senderButton?.tag ?? 100)
    }
    
    //  Reset to start game
    @IBAction func resetGame() {
        presenter?.resetGame()
        
        buttonBoxes.forEach {
            $0.setTitle("", for: .normal)
        }
    }
}

extension TicTacToeViewController: TicTacToeViewProtocol {
    
    func displayTitle(_title: ScreenTitle) {
        self.title = _title
    }
    
    func displayCurrentPlayerName(playerName: PlayerName) {
        labelCurrentPlayer.text = playerName
    }
    
    func setButtonTitle(title: String) {
        senderButton?.setTitle(title, for: .normal)
    }
    
}
