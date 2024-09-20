import Foundation

class MoviesViewModel: ObservableObject {
    @Published var movies: MoviesModel?
    @Published var errorMessage: String? = nil
    
    
    init() {
        fetchPopularMovies()
    }
    
    func fetchPopularMovies() {
        MoviesService.shared.fetchPopularMovies { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self.movies = movies
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
