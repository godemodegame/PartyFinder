import UIKit

protocol MapPresentationLogic {
  func presentData(response: Map.Model.Response.ResponseType)
}

class MapPresenter: MapPresentationLogic {
  weak var viewController: MapDisplayLogic?
  
  func presentData(response: Map.Model.Response.ResponseType) {
  
  }
  
}
