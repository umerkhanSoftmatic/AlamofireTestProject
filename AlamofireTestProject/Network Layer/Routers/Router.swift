import Foundation
import Alamofire

protocol APIRequest: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
}

extension APIRequest {
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL().appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch method {
        case .get:
            request = try URLEncoding.default.encode(request, with: parameters)
        default:
            request = try JSONEncoding.default.encode(request, with: parameters)
        }
        
        return request
    }
}





























































//URL Encoding: For GET requests, parameters are typically appended to the URL as query parameters. URL encoding ensures that special characters (like spaces and symbols) are correctly represented in the URL.

//JSON Encoding: For POST or PUT requests, the request body often needs to be in JSON format. JSON encoding converts Swift objects into a JSON representation.



//Encoding is required when sending data to an API (requests). It ensures that the data is in the correct format, compliant with API specifications, and properly transmitted.

//Decoding is required when receiving data from an API (responses). It transforms the received data into a format that can be used by your application.
