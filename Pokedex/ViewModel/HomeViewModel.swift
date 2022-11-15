//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Reza Ilham on 15/11/22.
//

import Foundation
import Alamofire

class HomeViewModel {
    
    private let view: HomeViewController
    
    var pokemons: [Pokemon] = []
    
    init(view: HomeViewController) {
        self.view = view
    }
    
    func getPokemonData() {
        AF.request("https://pokeapi.co/api/v2/pokemon").responseDecodable(of: PokemonList.self) { response in
            switch response.result {
            case .success(let result):
                self.pokemons = result.pokemons ?? []
                self.view.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfItemsInSection() -> Int {
        self.pokemons.count
    }
    
    func nameOfItem(index: Int) -> String {
        let pokemon = self.pokemons[index]
        return pokemon.name ?? ""
    }
    
    func imageOfItem(index: Int) -> String {
        let pokemon = self.pokemons[index]
        return pokemon.imageUrl ?? ""
    }
    
    func didItemSelected(index: Int) {
        var pokemon = self.pokemons[index]
        view.performSegue(withIdentifier: "toPokemonDetail", sender: pokemon)
    }
    
}
