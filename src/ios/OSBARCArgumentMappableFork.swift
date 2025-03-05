import OSBarcodeLib

protocol OSBARCArgumentMappableFork {
    init(value: Int)
}

extension OSBARCCameraModel: OSBARCArgumentMappableFork {
    init(value: Int) { self = value == 2 ? .front : .back }
}

extension OSBARCOrientationModel: OSBARCArgumentMappableFork {
    init(value: Int) {
        switch value {
        case 1: self = .portrait
        case 2: self = .landscape
        default: self = .adaptive
        }
    }
}
