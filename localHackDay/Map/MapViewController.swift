import UIKit
import NMAKit

protocol MapDisplayLogic: class {
    func displayData(viewModel: Map.Model.ViewModel.ViewModelData)
}

class MapViewController: UIViewController, MapDisplayLogic {
    
    var interactor: MapBusinessLogic?
    var router: (NSObjectProtocol & MapRoutingLogic)?
    
    @IBOutlet weak var mapView: NMAMapView!
    
    class Defaults {
        static let latitude: Double = 55.753742
        static let longitude: Double = 37.651129
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = MapInteractor()
        let presenter             = MapPresenter()
        let router                = MapRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.setupMap()
        
        self.interactor?.makeRequest(request: .fetchParties)
    }
    
    func setupMap() {
        self.mapView.mapScheme = NMAMapSchemeNormalNight
        self.mapView.zoomLevel = NMAMapViewMaximumZoomLevel - 5
        let geoCoord = NMAGeoCoordinates(latitude: Defaults.latitude,
                                         longitude: Defaults.longitude)
        self.mapView.set(geoCenter: geoCoord, animation: .none)
        
        let annotView = UIImageView(image: UIImage(systemName: "location.fill"))
        annotView.tintColor = .systemRed
        let overlay = NMAMapOverlay(annotView)
        overlay.coordinates = NMAGeoCoordinates(latitude: Defaults.latitude,
                                                longitude: Defaults.longitude)
        self.mapView.add(mapOverlay: overlay)
    }
    
    func displayData(viewModel: Map.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .addMarker(let party):
            let annotation = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))// UIImageView(image: UIImage(systemName: "pin.fill"))
            annotation.setImage(UIImage(systemName: "pin.fill"), for: .normal)
            annotation.addTarget(self, action: #selector(self.annotationTapped(_:)), for: .touchUpInside)
            annotation.tintColor = .red
            annotation.tag = party.id
            let overlay = NMAMapOverlay(annotation)
            overlay.coordinates = NMAGeoCoordinates(latitude: party.coordinates.latitude,
                                                    longitude: party.coordinates.longitude)
            self.mapView.add(mapOverlay: overlay)
        case .show(let party):
            let alertController = UIAlertController(title: party.name, message: party.description, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Пошли!", style: .cancel, handler: nil))
            alertController.addAction(UIAlertAction(title: "Отбой", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc private func annotationTapped(_ sender: UIButton) {
        self.interactor?.makeRequest(request: .chooseParty(index: sender.tag))
    }
}
