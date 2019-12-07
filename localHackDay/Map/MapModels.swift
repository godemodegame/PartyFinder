import UIKit

enum Map {
    enum Model {
        struct Request {
            enum RequestType {
                case fetchParties
                case chooseParty(index: Int)
            }
        }
        struct Response {
            enum ResponseType {
                case display(parties: [Party])
                case displayParty(party: Party)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case addMarker(_ party: Party)
                case show(party: Party)
            }
        }
    }
    
    struct Party {
        let id: Int
        let name: String
        let description: String
        let phoneNumber: String
        let coordinates: Coordinate
        
        struct Coordinate {
            let longitude: Double
            let latitude: Double
        }
    }
}
