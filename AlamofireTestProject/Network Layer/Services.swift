import Alamofire
import Foundation

//class MoviesService {
//    static let shared = MoviesService()
//    
//    private init() {}
//    
//    func fetchPopularMovies(completion: @escaping (Result<[MovieResult], Error>) -> Void) {
//        let url = "\(APIConstants.baseURL)/movie/popular"
//        let parameters: [String: Any] = [
//            "api_key": APIConstants.apiKey,
//            "page": 1
//        ]
//        
//        AF.request( url,
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





//class MoviesService {
//    static let shared = MoviesService()
//    
//    private init() {}
//    
//    func fetchPopularMovies(completion: @escaping (Result<[MovieResult], Error>) -> Void) {
//        let router = MoviesRouter.fetchPopularMovies
//        AF.request(router)
//            .validate()
//            .responseDecodable(of: MoviesModel.self) { response in
//                switch response.result {
//                case .success(let movies):
//                    completion(.success(movies.results ?? []))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//    }
//}




class MoviesService {
    static let shared = MoviesService()
    
    private init() {}
    
    func fetchPopularMovies(completion: @escaping (Result<MoviesModel, Error>) -> Void) {
        
        baseApi(MoviesRouter.fetchPopularMovies, responseType: MoviesModel.self) { result in
            completion(result)

        }
    }
}
