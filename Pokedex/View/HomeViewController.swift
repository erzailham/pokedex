//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Reza Ilham on 10/11/22.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = HomeViewModel(view: self)
        self.viewModel.getPokemonData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toPokemonDetail":
            let vc = segue.destination as? DetailViewController
            if let pokemon = sender as? Pokemon {
                vc?.pokemon = pokemon
            }
        default:
            break
        }
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokedexViewCell", for: indexPath) as? PokedexViewCell else {
            return UICollectionViewCell(frame: .zero)
        }
        cell.wrapperView.layer.cornerRadius = 8
        
        let name = viewModel.nameOfItem(index: indexPath.item)
        let image = viewModel.imageOfItem(index: indexPath.row)
        
        cell.pokeNameLabel.text = name
        cell.pokeImageView.sd_setImage(with: URL(string: image))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width/3)-16
        return CGSize(width: size, height: size)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didItemSelected(index: indexPath.item)
    }
    
}
