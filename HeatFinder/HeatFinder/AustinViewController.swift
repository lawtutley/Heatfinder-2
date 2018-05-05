//
//  AustinViewController.swift
//  HeatFinder
//
//  Created by Utley, Lawrence on 4/23/18.
//  Copyright © 2018 Utley, Lawrence. All rights reserved.
//

import UIKit
import MapKit


final class AustinShopAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
     init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
    }
    
    var region: MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
    
}

class AustinViewController: UIViewController {
    var selection: String!


    @IBOutlet weak var mapViewAustin: MKMapView!
    
    @IBOutlet weak var myFavInput: UITextField!
    @IBAction func mySaveButton(_ sender: Any) {
        selection = myFavInput.text
        global.shop = selection
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapViewAustin.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let ausCoordinate1 = CLLocationCoordinate2D(latitude: 30.266507, longitude: -97.737925)
        let ausAnnotation1 = AustinShopAnnotation(coordinate: ausCoordinate1, title: "Dirty Laundry USA", subtitle: "Dirty Laundry USA is your destination for streetwear apparel, footwear and accessories.")
        
        let ausCoordinate2 = CLLocationCoordinate2D(latitude: 30.315277, longitude: -97.716647)
        let ausAnnotation2 = AustinShopAnnotation(coordinate: ausCoordinate2, title: "Stax Austin", subtitle: "Vintage resell and consignment retailer.")
        
        let ausCoordinate3 = CLLocationCoordinate2D(latitude: 30.266798, longitude: -97.737569)
        let ausAnnotation3 = AustinShopAnnotation(coordinate: ausCoordinate3, title: "Private Stock Premium Sneaker and Apparel Boutique", subtitle: "Limited streetwear and sneaker consignment retailer.")
        
        mapViewAustin.addAnnotation(ausAnnotation1)
        mapViewAustin.setRegion(ausAnnotation1.region, animated: true)
        
        mapViewAustin.addAnnotation(ausAnnotation2)
        mapViewAustin.setRegion(ausAnnotation2.region, animated: true)
        
        mapViewAustin.addAnnotation(ausAnnotation3)
        mapViewAustin.setRegion(ausAnnotation3.region, animated: true)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AustinViewController: MKMapViewDelegate {
    func mapViewAustin(_ mapViewAustin: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let dirtyAnnotation = mapViewAustin.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as?
            MKMarkerAnnotationView {
            dirtyAnnotation.animatesWhenAdded = true
            dirtyAnnotation.titleVisibility = .adaptive
            dirtyAnnotation.titleVisibility = .adaptive
            
            return dirtyAnnotation
            
            
        }
        
        return nil
    }
    func mapViewAustin2(_ mapViewAustin: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let staxAnnotation = mapViewAustin.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as?
            MKMarkerAnnotationView {
            staxAnnotation.animatesWhenAdded = true
            staxAnnotation.titleVisibility = .adaptive
            staxAnnotation.titleVisibility = .adaptive
            
            return staxAnnotation
            
            
        }
        
        return nil
    }
    func mapViewAustin3(_ mapViewAustin: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let premeAnnotation = mapViewAustin.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as?
            MKMarkerAnnotationView {
            premeAnnotation.animatesWhenAdded = true
            premeAnnotation.titleVisibility = .adaptive
            premeAnnotation.titleVisibility = .adaptive
            
            return premeAnnotation
            
            
        }
        
        return nil
    }
}

