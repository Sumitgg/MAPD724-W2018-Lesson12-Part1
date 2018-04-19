
import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    
    // To fix
    let lat = 43.6532
    let long =  -79.3832
    var delta = 0.5
    let mapLocation = CLLocationCoordinate2DMake(43.6532, -79.3832)

    @IBOutlet weak var Latitude: UITextField!
    @IBOutlet weak var Longitude: UITextField!
    @IBOutlet weak var magText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loc = CLLocationCoordinate2DMake(lat, long)
        let span = MKCoordinateSpanMake(delta, delta)
        let reg = MKCoordinateRegionMake(loc, span)
        self.map.region = reg
        
       /* let ann = MKPointAnnotation()
        ann.coordinate = self.mapLocation
        ann.title = "Toronto"
        ann.subtitle = "A place that's really cool"
        self.map.addAnnotation(ann)
      */
    }

    @IBAction func seeInMapApp(_ sender: UIButton) {
        let placemark = MKPlacemark(coordinate: self.map.centerCoordinate, addressDictionary: nil)
        let mapitem = MKMapItem(placemark: placemark)
        mapitem.name = "Wonder where I am"
        
        // opens our location in the map app
        mapitem.openInMaps(launchOptions:[
            MKLaunchOptionsMapTypeKey: MKMapType.standard.rawValue,
            MKLaunchOptionsMapCenterKey: self.map.region.center,
            MKLaunchOptionsMapSpanKey: self.map.region.span
            ])
        
    }
    
    @IBAction func onSearch(_ sender: UIButton) {
        let myLong = Double( self.Longitude.text!)
        let myLat = Double( self.Latitude.text!)
        let mag = Double(self.magText.text!)
        let mapLocation = CLLocationCoordinate2DMake(myLat!, myLong!)
        let loc = CLLocationCoordinate2D(latitude: CLLocationDegrees(myLat!), longitude: CLLocationDegrees(myLong!))
        let span = MKCoordinateSpanMake(CLLocationDegrees(mag!), CLLocationDegrees(mag!))
        let reg = MKCoordinateRegionMake(loc, span)
        self.map.region = reg
       
        
        let ann = MKPointAnnotation()
        ann.coordinate = mapLocation
        ann.title = "Result Place"
        ann.subtitle = "Wonder where I am"
        self.map.addAnnotation(ann)
        
    }
    
}


