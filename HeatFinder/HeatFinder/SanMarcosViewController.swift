//
//  SanMarcosViewController.swift
//  HeatFinder
//
//  Created by Utley, Lawrence on 4/23/18.
//  Copyright © 2018 Utley, Lawrence. All rights reserved.
//

import UIKit
import MapKit

final class SanMarcosShopAnnotation: NSObject, MKAnnotation {
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
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
    
}

class SanMarcosViewController: UIViewController {

    @IBOutlet weak var mapViewSanMarcos: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapViewSanMarcos.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let smCoordinate1 = CLLocationCoordinate2D(latitude: 29.884793, longitude: -97.940112)
        let smAnnotation1 = SanMarcosShopAnnotation(coordinate: smCoordinate1, title: "Monkies", subtitle: "Vintage and streetwear resell shop.")
        
        let smCoordinate2 = CLLocationCoordinate2D(latitude: 29.884957, longitude: -97.940186)
        let smAnnotation2 = SanMarcosShopAnnotation(coordinate: smCoordinate2, title: "Vagabond", subtitle: "Vintage/thrift shop.")
        
        mapViewSanMarcos.addAnnotation(smAnnotation1)
        mapViewSanMarcos.setRegion(smAnnotation1.region, animated: true)
        
        mapViewSanMarcos.addAnnotation(smAnnotation2)
        mapViewSanMarcos.setRegion(smAnnotation2.region, animated: true)
        
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
extension SanMarcosViewController: MKMapViewDelegate {
    func mapViewAustin(_ mapViewAustin: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let monAnnotation = mapViewAustin.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as?
            MKMarkerAnnotationView {
            monAnnotation.animatesWhenAdded = true
            monAnnotation.titleVisibility = .adaptive
            monAnnotation.titleVisibility = .adaptive
            
            return monAnnotation
            
            
        }
        
        return nil
}
    func mapViewAustin2(_ mapViewAustin: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let vagAnnotation = mapViewAustin.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as?
            MKMarkerAnnotationView {
            vagAnnotation.animatesWhenAdded = true
            vagAnnotation.titleVisibility = .adaptive
            vagAnnotation.titleVisibility = .adaptive
            
            return vagAnnotation
            
            
        }
        
        return nil
    }
}
