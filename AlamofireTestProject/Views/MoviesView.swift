import SwiftUI

struct MoviesView: View {
    @StateObject private var moviesViewModel = MoviesViewModel()
    @StateObject private var searchViewModel = SearchViewModel()
    @StateObject private var logInViewModel = LoginViewModel()
    @StateObject private var logOutViewModel = LogOutViewModel()
    @Binding var isAuthenticated: Bool
   // @Binding var showPhoneAuth: Bool

    var body: some View {
        NavigationView {
            VStack {
                if let email = logInViewModel.userEmail {
                    Text("Logged in as: \(email)")
                        .font(.headline)
                        .padding()
                } else {
                    Text("No user logged in")
                        .font(.headline)
                        .padding()
                }
                
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
                        if let searchMovies = searchViewModel.searchMovies?.results {
                            ForEach(searchMovies, id: \.self) { movie in
                                MovieRow(movie: movie)
                            }
                        }
                    }
                }
                .navigationTitle("Movies")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            logOutViewModel.logout()
                        }) {
                            Text("Logout")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
        .onAppear {
            moviesViewModel.fetchPopularMovies()
            logInViewModel.fetchCurrentUserEmail() 
            
            logOutViewModel.onLogout = {
                isAuthenticated = false
            }
        }
    }
}
