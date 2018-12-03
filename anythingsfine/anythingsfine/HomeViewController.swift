//
//  HomeViewController.swift
//  anythingsfine
//
//  Created by Denny Ho on 10/25/18.
//

import UIKit
import Parse
import MapKit


class HomeViewController: UIViewController {
    
    @IBOutlet weak var recLabel: UILabel!
    @IBOutlet weak var yelpWebButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    
    var businesses: [Business]!
    var curBusiness: Business!
    var categoryList: [String] = ["Japanese","Thai","Chinese","Burgers","African","American","Fast Food","French","German","Italian","Mexican","Spanish"]
    var businessAddress: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        yelpWebButton.isHidden = true
        mapButton.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapOpenMaps(_ sender: Any) {
        coordinates(forAddress: businessAddress) {
            (location) in
            guard let location = location else {
                // Handle error here.
                return
            }
            self.openMapForPlace(lat: location.latitude, long: location.longitude)
        }
    }
    
    public func openMapForPlace(lat:Double = 0, long:Double = 0, placeName:String = "") {
        let latitude: CLLocationDegrees = lat
        let longitude: CLLocationDegrees = long
        
        let regionDistance:CLLocationDistance = 100
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = placeName
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
        
        
    }
    
    func coordinates(forAddress address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
    
       print(businessAddress)
        geocoder.geocodeAddressString(address) {
            (placemarks, error) in
            guard error == nil else {
                print("Geocoding error: \(error!)")
                completion(nil)
                return
            }
            completion(placemarks?.first?.location?.coordinate)
        }
    }
    
    @IBAction func onTapRequest(_ sender: Any) {
        
        self.recLabel.text = "Loading..."
        
        let randNum = Int(arc4random_uniform(UInt32(categoryList.count)))
        let searchTerm = categoryList[randNum]
        Business.searchWithTerm(term: searchTerm, completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            //self.businesses = businesses
            //self.tableView.reloadData()
            if let businesses = businesses {
                if businesses.count == 0 {
                    print("Try again!")
                    return;
                }
                let randNum2 = businesses.count - 1
                self.curBusiness = businesses[randNum2]
                print(self.curBusiness.name!)
                print(self.curBusiness.address!)
                print(self.curBusiness.yelpUrl)
                self.recLabel.text = self.curBusiness.name! + "\n" + self.curBusiness.address!
                self.businessAddress = self.curBusiness.address!
                self.yelpWebButton.isHidden = false
                self.mapButton.isHidden = false
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! YelpWebViewController
        vc.url = curBusiness!.yelpUrl ?? URL(string: "http://google.com")
        //print("webString is " + curBusiness.yelpUrl!)
    }
}
