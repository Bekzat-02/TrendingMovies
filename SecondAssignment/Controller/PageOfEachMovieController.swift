//
//  PageOfEachMovieController.swift
//  SecondAssignment
//
//  Created by admin on 25.04.2021.
//

import Foundation

import UIKit
import Alamofire
import Kingfisher

class PageOfEachMovieController: UIViewController {

    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var rateView: UIView!
    @IBOutlet private weak var rateLabel: UILabel!

    public static let identifier:String="PageOfEachMovieController"

    private var movie:MovieEntity.Movie? {
        didSet{
            if let movie=movie{
                let imageUrl=URL(string: "https://image.tmdb.org/t/p/w400"+(movie.poster ))
                imgView?.kf.setImage(with: imageUrl)
                rateLabel.text="\(movie.rating)"
                titleLabel.text=movie.title
                dateLabel.text=movie.releaseDate
            }
        }
    }
    public var movieId=0

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        rateView.layer.cornerRadius=25
        rateView.layer.masksToBounds=true
    }

}
extension PageOfEachMovieController{
    private  func getData()  {
        let url="https://api.themoviedb.org/3/movie/\(movieId)?api_key=1eba1647a537d3e8877424fde6a0c5f1"

        AF.request(url,method: .get, parameters: [:]).responseJSON{(data) in switch data.result{
        case .success:
            if let result=data.data{
                do  {
                    let movieJson=try JSONDecoder().decode(MovieEntity.Movie.self, from: result)
                    print(movieJson)
                    self.movie=movieJson.self
                }catch let jsonError{
                    print(jsonError)
                }
            }
        case .failure:
            print("url failed")
        }
        }
    }

}
