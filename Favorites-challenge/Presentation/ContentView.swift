//
//  ContentView.swift
//  Favorites-challenge
//
//  Created by César González Palomino on 23/6/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @EnvironmentObject var viewModel: FavoritesViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.favorites, id: \.self) { algo in
                Text(algo)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

final class FavoritesViewModel: ObservableObject {
    
    // MARK:- Subscribers
    private var cancellable: AnyCancellable?
    
    // MARK:- Publishers
    @Published var favorites: [String] = []

    // MARK:- Private properties
    private var getFavoritesUseCAse: GetFavoritesUseCaseProtocol
    
    init(getFavoritesUseCAse: GetFavoritesUseCaseProtocol) {
        self.getFavoritesUseCAse = getFavoritesUseCAse
        cancellable = self.getFavoritesUseCAse.getFavorites()
            .sink(receiveCompletion: {_ in },
                  receiveValue: { favorites in
                    self.favorites = favorites
                  })
    }
}
