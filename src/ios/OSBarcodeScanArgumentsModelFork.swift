import OSBarcodeLib

struct OSBarcodeScanArgumentsModelFork: Decodable {
    let scanInstructions: String
    let scanButtonText: String?
    let cameraDirection: OSBARCCameraModel
    let scanOrientation: OSBARCOrientationModel
    
    enum CodingKeys: CodingKey {
        case scanButton
        case scanInstructions
        case scanText
        case cameraDirection
        case scanOrientation
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let scanInstructions = try container.decode(String.self, forKey: .scanInstructions)
        
        var scanButtonText: String? // property is set based on `scanButton` and `scanText`.
        let scanButton = try container.decode(Bool.self, forKey: .scanButton)
        if scanButton { // only set `scanButtonText` if `scanButton` is enabled
            scanButtonText = try container.decode(String.self, forKey: .scanText)
        }
        
        // using hardcoded cameraDirection and scanOrientation
        //  because of compilation error related to duplicate OSBARCArgumentMappable extensions
        let cameraDirectionInt = try container.decode(Int.self, forKey: .cameraDirection)
        let cameraDirection = OSBARCCameraModel.back
        
        let scanOrientationInt = try container.decode(Int.self, forKey: .scanOrientation)
        let scanOrientation = OSBARCOrientationModel.adaptive
        
        self.init(scanInstructions, scanButtonText, cameraDirection, scanOrientation)
    }
    
    private init(_ scanInstructions: String, _ scanButtonText: String?, _ cameraDirection: OSBARCCameraModel, _ scanOrientation: OSBARCOrientationModel) {
        self.scanInstructions = scanInstructions
        self.scanButtonText = scanButtonText
        self.cameraDirection = cameraDirection
        self.scanOrientation = scanOrientation
    }
}
