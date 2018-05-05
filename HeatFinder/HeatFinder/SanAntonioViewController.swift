//
//  SanAntonioViewController.swift
//  HeatFinder
//
//  Created by Utley, Lawrence on 4/23/18.
//  Copyright © 2018 Utley, Lawrence. All rights reserved.
//

import UIKit
import MapKit

final class SanAntonioShopAnnotation: NSObject, MKAnnotation {
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
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
    
}

class SanAntonioViewController: UIViewController {

    @IBOutlet weak var mapViewSanAntonio: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapViewSanAntonio.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let saCoordinate1 = CLLocationCoordinate2D(latitude: 29.426788, longitude: -98.487682)
        let saAnnotation1 = SanAntonioShopAnnotation(coordinate: saCoordinate1, title: "Unique Knits", subtitle: "Sneaker consignment and streetwear retailer.")
        
        let saCoordinate2 = CLLocationCoordinate2D(latitude: 29.468075, longitude: -98.526258)
        let saAnnotation2 = SanAntonioShopAnnotation(coordinate: saCoordinate2, title: "House of Sin", subtitle: "Sneaker consignment and streetwear retailer.")
        
        let saCoordinate3 = CLLocationCoordinate2D(latitude: 29.510443, longitude: -98.506501)
        let saAnnotation3 = SanAntonioShopAnnotation(coordinate: saCoordinate3, title: "Sole Boutique", subtitle: "Sneaker consignment shop.")
        
        let saCoordinate4 = CLLocationCoordinate2D(latitude: 29.451271, longitude: -98.502920)
        let saAnnotation4 = SanAntonioShopAnnotation(coordinate: saCoordinate4, title: "The Vaulti", subtitle: "Sneaker resell shop and streetwear supplier.")
        
        mapViewSanAntonio.addAnnotation(saAnnotation1)
        mapViewSanAntonio.setRegion(saAnnotation1.region, animated: true)
        
        mapViewSanAntonio.addAnnotation(saAnnotation2)
        mapViewSanAntonio.setRegion(saAnnotation2.region, animated: true)
        
        mapViewSanAntonio.addAnnotation(saAnnotation3)
        mapViewSanAntonio.setRegion(saAnnotation3.region, animated: true)
        
        mapViewSanAntonio.addAnnotation(saAnnotation4)
        mapViewSanAntonio.setRegion(saAnnotation4.region, animated: true)
        
        
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
extension SanAntonioViewController: MKMapViewDelegate {
    func mapViewSanAntonio(_ mapViewAustin: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let uniAnnotation = mapViewAustin.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as?
            MKMarkerAnnotationView {
            uniAnnotation.animatesWhenAdded = true
            uniAnnotation.titleVisibility = .adaptive
            uniAnnotation.titleVisibility = .adaptive
            
            return uniAnnotation
            
            
        }
        
        return nil
    }
    func mapViewSanAntonio2(_ mapViewAustin: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let sinAnnotation = mapViewAustin.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as?
            MKMarkerAnnotationView {
            sinAnnotation.animatesWhenAdded = true
           sinAnnotation.titleVisibility = .adaptive
            sinAnnotation.titleVisibility = .adaptive
            
            return sinAnnotation
            
            
        }
        
        return nil
    }
    func mapViewSanAntonio3(_ mapViewAustin: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let soleAnnotation = mapViewAustin.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as?
            MKMarkerAnnotationView {
            soleAnnotation.animatesWhenAdded = true
            soleAnnotation.titleVisibility = .adaptive
            soleAnnotation.titleVisibility = .adaptive
            
            return soleAnnotation
            
            
        }
        
        return nil
    }
    func mapViewSanAntonio4(_ mapViewAustin: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let vauAnnotation = mapViewAustin.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as?
            MKMarkerAnnotationView {
            vauAnnotation.animatesWhenAdded = true
            vauAnnotation.titleVisibility = .adaptive
            vauAnnotation.titleVisibility = .adaptive
            
            return vauAnnotation
            
            
        }
        
        return nil
    }
}

