import UIKit

protocol TicTacToeViewProtocol: AnyObject {
    func displayTitle(_title: String)
    func displayCurrentPlayerName(playerName: String)
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
    
    @IBAction func buttonAction(_ sender: UIButton) {
        senderButton = sender
        presenter?.playerClickEvent(index: senderButton?.tag ?? 100)
    }
    
    @IBAction func resetGame() {
        presenter?.resetGame()
        
        buttonBoxes.forEach {
            $0.setTitle("", for: .normal)
        }
    }
}

extension TicTacToeViewController: TicTacToeViewProtocol {
    
    func displayTitle(_title: String) {
        self.title = _title
    }
    
    func displayCurrentPlayerName(playerName: String) {
        labelCurrentPlayer.text = playerName
    }
    
    func setButtonTitle(title: String) {
        senderButton?.setTitle(title, for: .normal)
    }
    
}
