import Foundation
import Alamofire

enum MoviesRouter: APIRequest {
    case fetchPopularMovies
    case searchMovies(query: String)
    
    var baseURL: String {
        return APIConstants.baseURL
    }
    
    var path: String {
        switch self {
        case .fetchPopularMovies:
            return "/movie/popular"
        case .searchMovies:
            return "/search/movie"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        switch self {
        case .fetchPopularMovies:
            return ["api_key": APIConstants.apiKey]
        case .searchMovies(let query):
            return ["api_key": APIConstants.apiKey, "query": query]
        }
    }
}
