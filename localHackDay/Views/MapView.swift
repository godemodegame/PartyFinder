import NMAKit

class MapView: NMAMapView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Change data source to HERE position data source
        NMAPositioningManager.sharedInstance().dataSource = NMAHEREPositionSource()

        // Set initial position
        self.mapScheme = NMAMapSchemeReducedNight

        // Set zoom level
        self.zoomLevel = NMAMapViewMaximumZoomLevel - 5

        // Set position indicator visible. Also starts position updates.
        self.positionIndicator.isVisible = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
