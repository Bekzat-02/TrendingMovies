//
//  ViewController.swift
//  SecondAssignment
//
//  Created by admin on 24.04.2021.
//

import UIKit
import Alamofire

class TrendingMoviesViewController: UIViewController {
    
    private let TRENDING_MOVIES_URL: String = "https://api.themoviedb.org/3/trending/all/day?api_key=1eba1647a537d3e8877424fde6a0c5f1"
    

    @IBOutlet weak var tableView: UITableView!
    
    private var movies: [MovieEntity.Movie] = [MovieEntity.Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        tableView.register(UINib(nibName: MovieCell.identifier, bundle: Bundle(for: MovieCell.self)), forCellReuseIdentifier: MovieCell.identifier)
        
        getTrendingMovies()
    }
}

extension TrendingMoviesViewController{
    
    private func getTrendingMovies(){
        AF.request(TRENDING_MOVIES_URL, method: .get, parameters: [:]).responseJSON { (data) in
            switch data.result {
            case .success:
                if let result = data.data {
                    do {
                        let moviesJSON = try JSONDecoder().decode(MovieEntity.self, from: result)
                        print(moviesJSON)
                    } catch let jsonError {
                        print(jsonError)
                    }
                }
            case .failure:
                print("TRENDING_MOVIES_URL is failure")
            }
        }
    }
}

    extension TrendingMoviesViewController : UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        }
    }
    
extension TrendingMoviesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        
        cell.posterImageView.backgroundColor = indexPath.row % 2 == 0 ? .systemGreen :
            .systemRed
        return cell
    }
    
        
    }

