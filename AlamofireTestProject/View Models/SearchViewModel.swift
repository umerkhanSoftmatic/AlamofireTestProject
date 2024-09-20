import Foundation
import Combine

@MainActor
class SearchViewModel: ObservableObject {
    
    @Published var searchText = ""
    @Published var searchMovies: MoviesModel?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupDebounce()
    }
    
    func searchMovies(query: String) {
        guard !query.isEmpty else {
            searchMovies = nil 
            return
        }
        
        SearchService.shared.searchMovies(query: query) { result in
            switch result {
            case .success(let movies):
                self.searchMovies = movies
            case .failure(let error):
                print("Error searching movies: \(error.localizedDescription)")
                self.searchMovies = nil
            }
        }
    }
    
    private func setupDebounce() {
        $searchText
            .debounce(for: .seconds(0.7), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { debouncedQuery in
                self.searchMovies(query: debouncedQuery)
            }
            .store(in: &cancellables)
    }
}
