enum FirebaseErrors: Error {
    case encodingError
    
    var errorMessage: String {
        switch self {
        case .encodingError:
            return AllStrings.firebaseEncodingError
        }
    }
}
