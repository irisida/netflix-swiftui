//
//  SearchView.swift
//  netflixclone
//
//  Created by ed on 17/05/2021.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel = SearchViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            viewModel.updateSearchText(with: $0)
        }
        
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchTextBinding, isLoading: $viewModel.isLoading)
                    .padding()
                
                ScrollView {
                    if viewModel.isShowingPopularMovies {
                        Text("PopularMovies View")
                    }
                    
                    if viewModel.viewState == .empty {
                        Text("Empty View")
                    }
                    
                    if viewModel.viewState == .ready && !viewModel.isShowingPopularMovies {
                        Text("Search Results View")
                    }
                    
                }
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
