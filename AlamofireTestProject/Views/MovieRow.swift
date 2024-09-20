
import SwiftUI

struct MovieRow: View {
    let movie: MovieResult

    var body: some View {
        VStack {
            if let posterPath = movie.poster_path {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(15)
                        .shadow(radius: 20)
                        .frame(width: 150, height: 200)
                } placeholder: {
                    ProgressView()
                        .frame(width: 150, height: 200)
                }
            }
            
            VStack {
                Text(movie.overview ?? "No overview")
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            .padding()
        }
    }
}
