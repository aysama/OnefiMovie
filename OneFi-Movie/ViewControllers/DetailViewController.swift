//
//  DetailViewController.swift
//  OneFi-Movie
//
//  Created by Ayoola Samagbeyi on 21/03/2019.
//  Copyright © 2019 Ayoola Samagbeyi. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    //Mark:- Initializing Variables
    @IBOutlet weak var opaqueView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var detailArray: AnyObject!
    var newDetailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Mark:- Set background color and opacity for opaqueView
        self.opaqueView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        
        //Mark:- Do any additional setup after loading the view.
        if (self.detailArray.count > 0){
            if let posterImage:String = self.detailArray["Poster"] as? String {
                if (posterImage != "") {
                    let imageurl = posterImage
                    DispatchQueue.main.async {
                        self.loadImage(url: imageurl, imageView: self.imageView)
                    }
                }
            }
        }
        
        //Mark:- Load New Details Array
        self.loadMovieDetails()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.backgroundColor = UIColor.clear
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Mark:- Customizing Navigation bar, Adding Image (OneFi Logo) as TitleView
        let nav = self.navigationController?.navigationBar
        
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 84, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "onefi")
        imageView.image = image
        navigationItem.titleView = imageView
    }

}

//Mark:- Extension with Data (Request/Collection, Update) Based Functions
extension DetailViewController {
    func loadImage(url: String, imageView: UIImageView) {
        let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let remoteImageURL = URL(string: encodedUrl)!
        
        Alamofire.request(remoteImageURL).responseData { (response) in
            if response.error == nil {
                // Show the downloaded image:
                if let data = response.data {
                    imageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    func loadMovieDetails(){
        //Mark:- Checking to make sure all values are present before continuing with operations
        
        if let title:String = self.detailArray["Title"] as? String {
            if (title != "" && title != "N/A"){
                let movieTitle = "Movie Title: " + title
                
                let year = self.detailArray["Year"] as! String
                let movieYear = "Year: " +  year
                
                let titleAndYear = movieTitle + " | " + movieYear
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(titleAndYear)
                    self.tableView.reloadData()
                }
            }
        }
        
        if let released:String = self.detailArray["Released"] as? String {
            if (released != "" && released != "N/A"){
                let movieReleased = "Released: " + released
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(movieReleased)
                    self.tableView.reloadData()
                }
            }
        }
        
        if let runtime:String = self.detailArray["Runtime"] as? String {
            if (runtime != "" && runtime != "N/A"){
                let movieRuntime = "Runtime: " + runtime
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(movieRuntime)
                    self.tableView.reloadData()
                }
            }
        }
        
        if let rated:String = self.detailArray["Rated"] as? String {
            if (rated != "" && rated != "N/A"){
                
                let movieRated = "Rated: " + rated
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(movieRated)
                    self.tableView.reloadData()
                }
            }
        }
        
        if let writer:String = self.detailArray["Writer"] as? String {
            if (writer != "" && writer != "N/A"){
                
                let movieWriter = "Writer: " + writer
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(movieWriter)
                    self.tableView.reloadData()
                }
            }
        }
        
        if let director:String = self.detailArray["Director"] as? String {
            if (director != "" && director != "N/A"){
                let movieDirector = "Director: " + director
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(movieDirector)
                    self.tableView.reloadData()
                }
            }
        }
        
        if let actors:String = self.detailArray["Actors"] as? String {
            if (actors != "" && actors != "N/A"){
                let movieActors = "Actors: " + actors
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(movieActors)
                    self.tableView.reloadData()
                }
            }
        }
        
        if let production:String = self.detailArray["Production"] as? String {
            if (production != "" && production != "N/A"){
                let movieProduction = "Production: " + production
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(movieProduction)
                    self.tableView.reloadData()
                }
            }
        }
        
        if let genre:String = self.detailArray["Genre"] as? String {
            if (genre != "" && genre != "N/A"){
                
                let movieGenre = "Genre: " + genre
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(movieGenre)
                    self.tableView.reloadData()
                }
            }
        }
        
        if let country:String = self.detailArray["Country"] as? String {
            if (country != "" && country != "N/A"){
                let movieCountry = "Country: " + country
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(movieCountry)
                    self.tableView.reloadData()
                }
            }
        }
        
        if let plot:String = self.detailArray["Plot"] as? String {
            if (plot != "" && plot != "N/A"){
                let moviePlot = "Plot: " + plot
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(moviePlot)
                    self.tableView.reloadData()
                }
            }
        }
        
        if let awards:String = self.detailArray["Awards"] as? String {
            if (awards != "" && awards != "N/A"){
                let movieAwards = "Awards: " + awards
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(movieAwards)
                    self.tableView.reloadData()
                }
            }
        }
        
        if let language:String = self.detailArray["Language"] as? String {
            if (language != "" && language != "N/A"){
                let movieLanguage = "Language: " + language
                
                //Mark:- Update Data and Display Asynchronously
                DispatchQueue.main.async {
                    self.newDetailArray.append(movieLanguage)
                    self.tableView.reloadData()
                }
            }
        }
    
    }
}

//Mark:- Extension for TableView Operations
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Mark:- Set number of
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newDetailArray.count
    }
    
    //Mark:- Set Values in TableView based on Data Available
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartcell = tableView.dequeueReusableCell(withIdentifier: "movieTableViewCell", for: indexPath) as? movieTableViewCell
        cartcell?.titleLabel.text = self.newDetailArray[indexPath.row]
        cartcell?.backgroundColor = UIColor.clear
        return cartcell!
    }
    
}


