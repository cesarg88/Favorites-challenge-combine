//
//  Favorites_challengeApp.swift
//  Favorites-challenge
//
//  Created by César González on 23/6/21.
//

import SwiftUI

@main
struct Favorites_challengeApp: App {
    
    var viewModel: FavoritesViewModel {
        let client1: CombineAPI = Client()
        let repo = FavoritesRepository(client: client1)
        let useCase = GetFavoritesUseCase(repository: repo)
        let viewModel = FavoritesViewModel(getFavoritesUseCAse: useCase)
        return viewModel
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

