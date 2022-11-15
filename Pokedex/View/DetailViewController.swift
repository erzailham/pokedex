//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Reza Ilham on 10/11/22.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeDescLabel: UILabel!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = pokemon?.name
        self.pokeDescLabel.text = pokemon?.name
        self.pokeImageView.sd_setImage(with: URL(string: pokemon?.imageUrl ?? ""))
    }
    

}
