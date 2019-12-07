import UIKit

protocol MapDisplayLogic: class {
  func displayData(viewModel: Map.Model.ViewModel.ViewModelData)
}

class MapViewController: UIViewController, MapDisplayLogic {

  var interactor: MapBusinessLogic?
  var router: (NSObjectProtocol & MapRoutingLogic)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
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
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func displayData(viewModel: Map.Model.ViewModel.ViewModelData) {

  }
  
}
