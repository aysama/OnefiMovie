//
//  ViewController.swift
//  OneFi-Movie
//
//  Created by Ayoola Samagbeyi on 21/03/2019.
//  Copyright © 2019 Ayoola Samagbeyi. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class ViewController: UIViewController {
    
    //Initializing Variables
    @IBOutlet weak var collectionView: UICollectionView!
    let movies = ["Batman", "Batman and Robin", "Batman", "Batman", "Batman Returns", "Batman Forever", "Batman & Robin", "Batman Begins", "The Dark Knight", "The Dark Knight Rises", "Batman v Superman: Dawn of Justice", "Suicide Squad", "Justice League", "Joker", "Superman", "Man Of Steel", "Ant-man", "Spider-Man: Homecoming"]
    let years = [1943, 1949, 1966, 1989, 1992, 1995, 1997, 2005, 2008, 2012, 2016, 2016, 2017, 2019, 1978, 2013, 2015, 2017]
    var movie:String!
    var year:Int!
    var imageWidth:Int!
    var collectionData = [AnyObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Mark:- Deducted 40 (set as 20marginleft and 20marginright in the constraints) + 20 spacing between two cells
        let width = (view.frame.size.width - 60) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        self.imageWidth = Int(width)
        
        //Mark:- Using this For Loop to create URL based on Movies Array and Years Array and populate dictionary with values for each Movie
        for i in 0...movies.count-1 {
            let mov = movies[i]
            let yr = years[i]
            let urlstring = "https://www.omdbapi.com/?apikey=1fe468b0&t=\(mov)&y=\(yr)"
            let urlString2 = urlstring.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let myurl = URL(string: urlString2 ?? "http://google.com")!
            self.getData(url: myurl)
        }
        
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

//Mark:- Create extension for UICollectionView operations :)
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Mark:- Define number of cells depending on size of data
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    //Mark:- Set data for elements of cells in UICollectionView
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cvCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvcell", for: indexPath) as? collectionViewCell
        let celldata = self.collectionData[indexPath.row]
        let posterurl = celldata["Poster"] as? String ?? ""
        let cellImage = cvCell?.collectionImageView!
        loadImage(url: posterurl, imageView: cellImage!)
        cvCell?.titlelabel.text = celldata["Title"] as? String
        cvCell?.directorlabel.text = celldata["Director"] as? String
        cvCell?.yearlabel.text = celldata["Year"] as? String
        return cvCell!
    }
    
    //Mark:- When User Taps any cell in UICollectionView, he/she is taken to page with more movie details
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "movieDetails") as! DetailViewController
        vc.detailArray = self.collectionData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    //Mark:- Loading Image Data for ImageView sing Alamofire
    func loadImage(url: String, imageView: UIImageView) {
        let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let remoteImageURL = URL(string: encodedUrl)!
        
        Alamofire.request(remoteImageURL).responseData { (response) in
            if response.error == nil {
                // Show the downloaded image:
                if let data = response.data {
                    imageView.image = UIImage(data: data)
                    imageView.frame = CGRect(x: 0, y: 0, width: self.imageWidth, height: self.imageWidth)
                }
            }
        }
    }
    
    //Mark:- Reusable function to collect Data from URL
    func getData(url: URL) {
        //sending HTTP POST request using Alamofire
        Alamofire.request(url, method: .get, encoding: URLEncoding(destination: .queryString)).responseJSON {
            response in

            //getting the json value from the server
            let result = response.result
            switch(result){

            case .success(_):
                let dataresult = result.value as AnyObject
                DispatchQueue.main.async {
                    self.collectionData.append(dataresult)
                    self.collectionView.reloadData()
                }
            case .failure(_):
                print("we failed here")

            }

        }
    }
    
}

