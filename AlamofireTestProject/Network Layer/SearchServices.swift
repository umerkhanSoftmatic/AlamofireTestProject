import Alamofire
import Foundation

//class SearchService {
//    static let shared = SearchService()
//    
//    private init() {}
//    
//    func searchMovies(query: String , completion: @escaping (Result<[MovieResult], Error>) -> Void) {
//        let url = "\(APIConstants.baseURL)/search/movie?&query=\(query)"
//        let parameters: [String: Any] = [
//            "api_key": APIConstants.apiKey,
//            "page": 1
//        ]
//        
//        AF.request(url,
//                   method: .get,
//                   parameters: parameters
//        )
//        .validate()
//        .responseDecodable(of: MoviesModel.self) {
//            response in
//            switch response.result {
//            case .success(let movies):
//                completion(.success(movies.results ?? []))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//}





//class SearchService {
//    
//    static let shared = SearchService()
//    
//    private init () {}
//    
//    func searchMovies(query: String , completion: @escaping (Result<[MovieResult] , Error>) -> Void) {
//        let router = MoviesRouter.searchMovies(query: query)
//        AF.request(router)
//        .validate()
//        .responseDecodable(of: MoviesModel.self) {
//            response in
//            switch response.result {
//            case .success(let movies):
//                completion(.success(movies.results ?? []))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//    
//}




class SearchService {
    
    static let shared = SearchService()
    
    private init () {}
    
    func searchMovies(query: String , completion: @escaping (Result<MoviesModel , Error>) -> Void) {
        baseApi(MoviesRouter.searchMovies(query: query), responseType: MoviesModel.self) { result in
            completion(result)
            
//            switch result {
//            case .success(let moviesModel):
//                completion(.success(moviesModel.results ?? []))
//            case .failure(let error):
//                completion(.failure(error))
//            }
            
        }
        
    }
}
