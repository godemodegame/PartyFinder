import UIKit

protocol MapBusinessLogic {
  func makeRequest(request: Map.Model.Request.RequestType)
}

class MapInteractor: MapBusinessLogic {

  var presenter: MapPresentationLogic?
  var service: MapService?
  
  func makeRequest(request: Map.Model.Request.RequestType) {
    if service == nil {
      service = MapService()
    }
  }
  
}
