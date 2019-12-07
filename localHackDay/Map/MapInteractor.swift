import UIKit

protocol MapBusinessLogic {
    func makeRequest(request: Map.Model.Request.RequestType)
}

class MapInteractor: MapBusinessLogic {
    
    var presenter: MapPresentationLogic?
    var service: MapService?
    
    let parties: [Map.Party] = [.init(id: 0, name: "Гостиница Эрмитаж Дурасовский пер., 7",
                                      description: """
Впишу 1-2 девушек на кальян и вино!
Можно заценить кино,заказать че,
потусить без кипиша,пишите в лс!
С закрытых страниц,без фото не вписываю!
""",
                                      phoneNumber: "+7 965 194 01 60",
                                      coordinates: .init(longitude: 37.650152, latitude: 55.752999)),
                                .init(id: 1, name: "Посольство индии", description: """
मस्त लड़कियों के लिए मस्त चूत
शांत भारतीय लोगों के साथ आरामदायक पार्टी
""",
                                      phoneNumber: "+7 934 615 21 43",
                                      coordinates: .init(longitude: 37.649908, latitude: 55.752851))]
    
    func makeRequest(request: Map.Model.Request.RequestType) {
        if self.service == nil {
            self.service = MapService()
        }
        
        switch request {
        case .fetchParties:
            self.presenter?.presentData(response: .display(parties: self.parties))
        case .chooseParty(let index):
            self.presenter?.presentData(response: .displayParty(party: parties[index]))
        }
    }
}
