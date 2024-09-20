import SwiftUI

struct MoviesView: View {
    @StateObject private var moviesViewModel = MoviesViewModel()
    @StateObject private var searchViewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(searchText: $searchViewModel.searchText)
                    .padding(.top)
                
                List {
                    if searchViewModel.searchText.isEmpty {
                        if let movies = moviesViewModel.movies?.results {
                            ForEach(movies, id: \.self) { movie in
                                MovieRow(movie: movie)
                            }
                        } else {
                            Text("No movies available")
                                .foregroundColor(.gray)
                        }
                    } else {
                        if let searchmovies = searchViewModel.searchMovies?.results {
                            ForEach(searchmovies, id: \.self) { movie in
                                MovieRow(movie: movie)
                            }
                        }
                    }
                }
                .navigationTitle("Movies")
            }
        }
        .onAppear {
            moviesViewModel.fetchPopularMovies()
        }
    }
}
