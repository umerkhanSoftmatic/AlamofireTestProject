// MARK: - MoviesModel
struct MoviesModel: Codable, Hashable {
    var page: Int?
    var results: [MovieResult]?
    var total_pages: Int?
    var total_results: Int?
    

}

// MARK: - MovieResult (stored in entity in Core Data)
struct MovieResult: Codable, Hashable {
    var adult: Bool?
    var backdrop_path: String?
    var genreIDS: [Int]?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?


}
