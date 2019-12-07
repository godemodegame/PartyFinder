import UIKit

protocol MapPresentationLogic {
    func presentData(response: Map.Model.Response.ResponseType)
}

class MapPresenter: MapPresentationLogic {
    weak var viewController: MapDisplayLogic?
    
    func presentData(response: Map.Model.Response.ResponseType) {
        switch response {
        case .display(let parties): parties.forEach { self.viewController?.displayData(viewModel: .addMarker($0)) }
        case .displayParty(let party): self.viewController?.displayData(viewModel: .show(party: party))
        }
    }
    
}
