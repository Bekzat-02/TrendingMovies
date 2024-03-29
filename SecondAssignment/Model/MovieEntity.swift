
import Foundation

struct MovieEntity : Decodable{
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    
    struct Movie : Decodable{
        let id: Int
        let poster: String
        let title: String
        let releaseDate: String
        let rating: Double
        
        enum CodingKeys: String, CodingKey {
            case id
            case poster = "poster_path"
            case title = "title"
            case releaseDate = "release_date"
            case rating = "vote_average"
        }
    }
}
