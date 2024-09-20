import Foundation
import Alamofire


func baseApi<T: Decodable>(_ router: APIRequest, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
    AF.request(router)
        .validate()
        .responseDecodable(of: responseType) { response in
            switch response.result {
            case .success(let pass):
                completion(.success(pass))
            case .failure(let fail):
                completion(.failure(fail))
            }
        }
}
