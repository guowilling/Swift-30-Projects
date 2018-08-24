
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameIDLabel: UILabel!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeInfoLabel: UILabel!
    
    var pokemon: Pokemon! {
        didSet (newPokemon) {
            self.refreshUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshUI()
    }
    
    func refreshUI() {
        self.title = pokemon.name
        
        nameIDLabel?.text = pokemon.name + (pokemon.id < 10 ? " #00\(pokemon.id)" : pokemon.id < 100 ? " #0\(pokemon.id)" : " #\(pokemon.id)")
        pokeImageView?.image = LibraryAPI.sharedInstance.downloadImg(pokemon.pokeImgUrl)
        pokeInfoLabel?.text = pokemon.detailInfo
    }
}

extension DetailViewController: PokemonSelectionDelegate {
    
    func pokemonSelected(_ newPokemon: Pokemon) {
        pokemon = newPokemon
    }
}
