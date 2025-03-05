private struct OSBarcodeErrorLabelsFork {
    static let code = "code"
    static let codeFormat = "OS-PLUG-BARCFK-"
    static let message = "message"
}

enum OSBarcodeErrorFork: Int, CustomNSError, LocalizedError {
    case scanningError = 4
    case scanningCancelled = 6
    case cameraAccessDenied = 7
    case scanInputArgumentsIssue = 8
    
    var errorDescription: String? {
        switch self {
        case .scanningError: return "Error while trying to scan code."
        case .scanningCancelled: return "Couldn’t scan because the process was cancelled."
        case .cameraAccessDenied: return "Couldn’t scan because camera access wasn’t provided. Check your camera permissions and try again."
        case .scanInputArgumentsIssue: return "Scanning parameters are invalid."
        }
    }
    
    var errorDictionary: [String: String] {
        [
            OSBarcodeErrorLabelsFork.code: "\(OSBarcodeErrorLabelsFork.codeFormat)\(String(format: "%04d", self.rawValue))",
            OSBarcodeErrorLabelsFork.message: self.errorDescription ?? ""
        ]
    }
}
